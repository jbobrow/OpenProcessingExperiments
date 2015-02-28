
float x = mouseX;
float y = mouseY;
float eyeRadius=40;
float angle=0.0;
float offset= 60;
float scalar= 30;
float speed = 0.05;
void setup (){
  size(600,600);
  smooth();
}
void draw(){
   background(255);
    x = mouseX;
   y = mouseY;
 
  
  fill(random(255),0,0);
  textSize(random(100));
  text("ERROR!",random(width),random(height));

  

   
    noStroke();
    fill(100);
  rect(150,200,300,200);
    
  strokeWeight(10);
  stroke(0);
  // head
  fill(100);
  
  bezier(150,200,220,180,350,180,450,200);//top
  bezier(450,200,460,300,460,350,450,400);//right
  bezier(150,400,220,420,350,420,450,400);//bottom
  bezier(150,200,140,300,140,350,150,400);//left
     
  // body
  rect(250,415,100,100);
  //feet
  bezier (250,515,250,600,280,600,280,515);//left
  bezier (320,515,320,600,350,600,350,515);//right
  noFill();
  //arms
  bezier (200,415,200,500,x*0.6,y*0.5,x*0.6,y*0.8);//left
  bezier (400,415,400,500,x*0.8,y*0.5,x*0.8,y*0.8);//right
  //eyes
   float i=offset+cos(angle)* scalar;
  float j= offset+ sin(angle)* scalar;
  
  fill(x, y, 20);
  ellipse(i+180,j+210,eyeRadius,eyeRadius);//left
  ellipse(i+280,j+210,2*eyeRadius,2*eyeRadius);//right
  angle+= speed;
  
  noFill();
  strokeWeight(20);
  if (mousePressed){
    eyeRadius=60;
  }else{
    eyeRadius=40;
    
  }

  //teeth
  beginShape();
  vertex(210,360);
  vertex(370,360);

  vertex(350,380);
  vertex(330,365);
  vertex(310,380);
  vertex(290,365);
  endShape();
  
   //arms
  
  bezier (200,415,200,500,x*0.6,y*0.5,x*0.6,y*0.8);//left
  bezier (400,415,400,500,x*0.8,y*0.5,x*0.8,y*0.8);//right
   // chest
   fill(random(255),0,0);
   textSize(20);
   text("ERROR!",265, 450);

}


