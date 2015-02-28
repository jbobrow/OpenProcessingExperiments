
// **Created by Aparna J. Nambiar
//Displays lightning strokes

Lightning l1,l2; 
 int branchX;
 int branchY;
 int branchTarX;
 int branchTarY;
 int counter;
 int innerCounter;
 int direction;
 
 Lightning[] l = new Lightning[20];
 int lightningCount=5;
 int finishCount=0;
 
 
public void setup(){
  
  screenWidth=500;
  screenHeight=300;
  size(500,300);
  smooth();
  background(0);
  counter=0;
 int rootX=(int)random(100,screenWidth-100);
     int rootY=(int)random(0,5);
     for(int i=0;i<lightningCount;i++){
        l[i] = new Lightning((int)random(100,screenWidth-100), (int)random(0,5),5,2,600);
     }
}

public void draw(){
  for(int i=0;i< lightningCount;i++){
  
  
//    if(l[i]!=null){
      l[i].draw();
//    }
  }
  counter++;
  
  
  //  print(counter);
  if(counter>0 && counter%21==0 && lightningCount<l.length){
    int chosen = (int) random(0, 3);
     branchX = l[chosen].rootX;
     branchY = l[chosen].rootY;
     
     l[lightningCount] = new Lightning(branchX, branchY,3, (int)random(0,2), 50);
    lightningCount++;
  }
 
  if(finishCount>=1){
    background(0);
     for(int i=0;i<3;i++){
        l[i] = new Lightning((int)random(100,screenWidth-100), (int)random(0,5),3,2,600);
         l[i].draw();
     }
     
      for(int i=3;i<lightningCount;i++){
        l[i] = null;
//         l[i].draw();
     }
     lightningCount =3;
     finishCount =0;
  }
  
}



public class Lightning {
  int rootX; 
 int rootY;
 int targetX;
 int targetY;
 int weight;
 float negDirection, posDirection;
 int localCounter;
 int maxLength;
 public Lightning (int rootx,int rooty, int strokeWeight, int direction, int length){
   this.rootX= rootx;
   this.rootY = rooty;
   this.weight = strokeWeight;
   maxLength = length;
   localCounter =1;
   if(direction ==2){
     negDirection =0.5;
     posDirection =0.5;
   }
   else if(direction ==1){
     negDirection =0;
     posDirection =1;
   }else if(direction ==0){
     negDirection =1;
     posDirection =0;
   }
 }
 
 public void draw(){
   if(localCounter< maxLength){   localCounter++;
   
 targetX=rootX+(int)random(-8 * negDirection,8 * posDirection);
  targetY=rootY+(int)random(0,5);
  stroke(255);
  strokeWeight(weight);
  line(rootX, rootY, targetX, targetY);
  rootX=targetX;
  rootY=targetY;
   }
  if(targetY==screenHeight){
     finishCount++;print("inside");
   }
 }
}

