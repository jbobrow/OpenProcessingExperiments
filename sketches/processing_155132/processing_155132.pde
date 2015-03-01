
// Given an array of edges in a directed graph, this algorithm will find all paths 
// from a specified source node to all possible sinks.

import java.util.*;
import java.lang.*;

// The directed graph is specified by a list of edges like so:
int[][]edges = {
   {1,2},
   {1,3},
   {1,4},
   {2,7},
   {3,8},
   {4,9},
   {9,10},
   {5,6},
   {6,7}
  };
int edgeLength =9;

// This is the list of source nodes for the graph
int[] sources = {1, 5};

boolean init = true;

void setup(){
  size(200,200);
  background(0);
  text("Sources",20,20);
   text(Arrays.toString(sources),20,40);
  }

void draw()
{
 if(init){
  text("PATHS",20,70); 
  for(int i=0;i<sources.length;i++){
     ArrayList<ArrayList<Integer>> Allpaths= getPaths(sources[i]);
     text(Allpaths.toString(),20,(i*20)+90);
     init = false;
    }  
   }
}

ArrayList<ArrayList<Integer>> getPaths(int source)
{
  ArrayList<ArrayList<Integer>> childPaths = new ArrayList<ArrayList<Integer>>();;
  ArrayList<ArrayList<Integer>> oldPaths = new ArrayList<ArrayList<Integer>>();
  ArrayList<ArrayList<Integer>> master= new  ArrayList<ArrayList<Integer>>(); 
  ArrayList<Integer> sourcePath = new ArrayList<Integer>();
  sourcePath.add(source);
  master.add(sourcePath);
  do{ 
   if (master!=null) {
     oldPaths = new   ArrayList<ArrayList<Integer>>(); 
     childPaths = new ArrayList<ArrayList<Integer>>();
    for(ArrayList<Integer> path:master){
      int lastNode = path.get(path.size()-1);
       ArrayList<Integer> children = getChildNodes(lastNode);
        if(children!=null){
          for(int child:children){
            ArrayList<Integer> path_temp= new ArrayList<Integer>(path);  
            path_temp.add(child);
            childPaths.add(path_temp); 
            oldPaths.add(path);      
     }}}
   for(ArrayList<Integer> childPath:childPaths){master.add(childPath);}
   for(ArrayList<Integer> oldPath:oldPaths){ int masterIdx = master.indexOf(oldPath); if(masterIdx>=0)master.remove(masterIdx);}
  }
 }while(childPaths.size()>0);
 return master;
}




ArrayList<Integer> getChildNodes(int node)
{
  ArrayList<Integer> children = new ArrayList<Integer>();
  for(int i=0; i<edgeLength;i++)
  {
    if(edges[i][0]==node) {children.add(edges[i][1]);
    }
  } 
  return children;
}

