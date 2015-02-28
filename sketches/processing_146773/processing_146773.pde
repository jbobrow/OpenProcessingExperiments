
//Naomi Rauch
//CS 118
//May 1, 2014



float dhead = 50; //diameter of head
float dbody = 100; //diameter of body
float xhead;
float yhead;

void setup (){

size(400,400);
background(255);
smooth();

yhead = height/2 - dbody-dhead/2; //y coordinate of head
xhead = 50; //x coordinate of head
}

void draw () {

noStroke();
 //bird head
fill(255,255,0);
ellipse(xhead,yhead,dhead,dhead);
//beak
fill(255,0,255);
triangle(xhead+dhead/15,yhead+dhead/8,xhead-dhead/15,yhead+dhead/8,xhead,yhead+dhead/2); //forward
//eye
fill(0);
ellipse(xhead+xhead/18,yhead,dhead/8,dhead/8);
ellipse(xhead-xhead/18,yhead,dhead/8,dhead/8);
//tail
fill(100,200,300);
quad(xhead-dhead/2,yhead+dhead/2+dbody/2, xhead+dhead/2,yhead+dhead/2+dbody/2,xhead + dhead, yhead+dhead/2+1.5*dbody, xhead-dhead, yhead+dhead/2+1.5*dbody);
//body
fill(255,255,0);
ellipse(xhead,yhead+dhead/2+dbody/2,dhead*1.3,dbody);
//wings
fill(255,0,0);
ellipse(xhead-dhead/2,yhead+dhead/2+dbody/2,dhead/4, dbody);
ellipse(xhead+dhead/2,yhead+dhead/2+dbody/2,dhead/4, dbody);


//wire
stroke(0);
strokeWeight(3);
line(0,height/2,width,height/2);



  
  
  
}


