package com.aravind.service;

import com.hazelcast.config.Config;
import com.hazelcast.config.FileSystemXmlConfig;
import com.hazelcast.core.Hazelcast;
import com.hazelcast.core.HazelcastInstance;
import com.hazelcast.core.Member;

import java.io.FileNotFoundException;
import java.util.Set;

/**
 * This Class is responsible for stopping and starting the HazelCast
 * as a Service. On Windows the class will be used by the Procrun to start
 * or stop the server.
 *
 */
public class HazelCastService {

    public static HazelcastInstance instance = null;

    public static void start(String[] args) throws FileNotFoundException {

        System.out.println("All Passed In Arguments For Start are --> "+args);
        String configPath = null;
        if(args!=null && args.length>0)
                configPath=args[0];
        else
            throw new FileNotFoundException("The Passed in File Path is Null oe Empty");

        System.out.println("Config Path -->"+configPath);
        Config config = new FileSystemXmlConfig(configPath);
        instance = Hazelcast.newHazelcastInstance(config);
        System.out.println("After Hazelcast start -->");
        Set<Member> members = instance.getCluster().getMembers();
        if(members!=null && !members.isEmpty())
        {
            for(Member member:members) {
                System.out.println(member);
            }
        }
    }

    public static void stop(String[] args) {
        System.out.println("stop");
        if(instance!=null) {
            instance.shutdown();
            System.out.println("Instance Shutdown");
        }
    }

    /*
    Enable this and pass file location if you have to pass it locally.

    public static void main(String[] args) throws FileNotFoundException

    {
        if ("start".equals(args[0])) {
                     ** Replace here the file location **
            start(new String []{"...\\hazelcast.xml"});
        } else if ("stop".equals(args[0])) {
            stop(args);
        }
    }*/
}
