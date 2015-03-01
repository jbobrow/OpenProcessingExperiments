
ArrayList<Tree> branches;


void setup(){
  //size of sketch, initial bgcolor
  size(800,800);
  background(255);
  
  //initialize array list
branches = new ArrayList<Tree>();

//add first snowflake object
branches.add(new Tree(width/2,height,0));
  
}

void draw(){
  //draw background
  background(255);
  
  for(int i = 0; i < branches.size(); i++){
    Tree branch = branches.get(i);  //name and initialize the new object!
    branch.update();
//    branch.displayLeaves();
    branch.displayBranches();
    print(branches.get(0).children + " ");
    println(branches.size());
   
    }
 // println(branches.size());
  
  if(branches.size()<150){
  for(int i = branches.size()-1; i < branches.size(); i++){    
   int branchNum = int(random(2));
      
   for(int j = 0; j < branchNum; j++){   
   if(branches.get(i).grown == 1){ 
     
     
     if(branches.get(i).children <= 3){
     branches.add(new Tree(branches.get(i).fEndX,branches.get(i).fEndY,1));
     }
     
     
     for(int a = 0; a < branches.size(); a++){
     branches.get(a).gaveBirth(); 
     }
     
   } 
   for(int k = 0; k < branches.size(); k++){
   if(i>k){
     if(branches.get(i).grown == 1){ 
       
        if(branches.get(i-(k+1)).children < 3){
    branches.add(new Tree(branches.get(i-(k+1)).fEndX,branches.get(i-(k+1)).fEndY,1));
        }
    
     for(int a = 0; a < branches.size(); a++){
//     branches.get(a).gaveBirth(); 
     }
   
   
     }
  }
  }

   }   
   }  
  }

//add a new snowflake each frame!  
if(mousePressed){
  setup();
}
  
}

class Tree {
  
  float posX;
  float posY;
  
  float endX;
  float endY;
  
  float fEndX;
  float fEndY;
  
  float ranY = 75;
  float ranX = 75;
  
  float radius;
  
  int grown = 0;
  
  float easing;
  
  int children;
  float fChildren;
 
 Tree(float x, float y, int n){
   
   easing = .5;
   
   posX = x;
   posY = y;
   
   fEndX = posX;
   fEndY = posY;
   
   if(n == 0){
   endX = posX;
   }else{
   endX = posX+random(-ranX,ranX);
   }
    
   
   float ss = map(branches.size(),0,200,0,75);
   
   
     
   endY = posY-random(75,ranY)+ss;  
 
 
   
 }
 
 void update(){
   
   float ee = map(branches.size(),0,200,.5,.0001);
   
   easing = ee;
  
   fEndX += (endX - fEndX) * easing;
   fEndY += (endY - fEndY) * easing;
   
   if(dist(fEndX,fEndY,endX,endY)<7){
     grown = 1;
   }else{
     grown = 0;
   }
   
 }
 
 void gaveBirth(){
   children += 1;
    
 }
 
 void displayBranches(){
   fChildren += (children - fChildren) * easing;
   stroke(140,120,50);
   strokeWeight(1+(fChildren*2));
   line(posX,posY,fEndX,fEndY);  
 }
 

  
}
