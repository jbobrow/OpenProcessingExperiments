
//import PDF library 
import processing.pdf.*;
 
//create a boolean to turn recording on/off
boolean record;

void setup () {
size (480, 720);
background (120,20,30);
}

void draw (){

//Rect in the Center


rectMode(CENTER);
fill(100,20,30);
noStroke();
rect(width/2,height/2,width,420);

fill(70,20,30);
noStroke();
rect(width/2,height/2,width,200);

rectMode(CENTER);
stroke(34,188,190);
strokeWeight(15);
fill(50,77,91);
rect(width/2,height/2,200,300);

//rect as outlines
noFill();
stroke(120,20,30);
strokeWeight(5);

//red one outline
rect(width/2,height/2,180,280);
//2nd red one outline
rect(width/2,height/2,160,260);
//green one outline
stroke(34,188,190);
rect(width/2,height/2,140,240);

//circle
noFill();
ellipse(width/2,height/2,50,50);

//strokeWeight(3);
//ellipse(width/2,height/2,700,70);

//Triangles
fill(120,20,30);
 strokeWeight(3);
 
  //1
 triangle (width/2-50, height/2+30, width/2, height/2, width/2-50, height/2-30);  
  //2
  triangle (width/2+50, height/2-30, width/2, height/2, width/2+50, height/2+30);
   strokeWeight(2);

  //outside
   //1
 triangle (width/2-50, height/2+30, width/2, height/2, width/2-50, height/2-30);  
  //2
  triangle (width/2+50, height/2-30, width/2, height/2, width/2+50, height/2+30);
   strokeWeight(2);
  

//Little squares
stroke(34,188,190);
strokeWeight(2);
fill(50,77,91);

//Top
for(int j=15; j<=height; j+=30){
rect(j,100,10,10);
}

for(int z=15; z<=height; z+=30){
rect(z,130,8,8);
}


//Bottom
for(int i=15; i<=height; i+=30){
rect(i,630,10,10);
}
for(int x=15; x<=height; x+=30){
rect(x,600,8,8);
}

//Rectangulos Top and Bottom



rectMode(CENTER);
fill(50,77,91);
noStroke();

//Top
rect(width/2,20,width,40);

//Bottom
rect(width/2,700,width,40);

//Top
for(int j=5; j<=width; j+=7){  
stroke(34,188,190); 
strokeWeight(.5);
line (j,5,j,35);

line (j,height-5,j,height-35);

}


//lines punteadas in the top
noStroke();
fill (34,188,190);
for(int h=16; h<=height; h+=30){
rect(h,116,15,2);

//lines punteadas in the bottom
fill (34,188,190);
for(int o=16; o<=height; o+=30){
rect(o,616,15,2);
}

}
}






