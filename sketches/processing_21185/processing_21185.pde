
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),100,255,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}

void setup(){
size(600,600);

}

void draw(){


pushMatrix();
 background(255);

//foreground
fill(105,105,105);
rect(0,0,width,height);

//horizon
fill(119,136,153);
rect(0,0,width,height/2);


//George
translate(mouseX,mouseY);
fill(255,218,185);
ellipse(40,40,5,5);
ellipse(50,50,50,50);
fill(10,10,200);
ellipse(40,40,1,1);
ellipse(40,40,10,10);
ellipse(60,40,10,10);
fill(255,0,0);
ellipse(50,60,10,10);
fill(30,40,60);
rect(40,75,20,20);
line(40,75,30,100);
fill(10,10,200);
rect(40,90,20,30);
line(60,75,70,100);
line(40,75,40,120);
line(60,75,60,120);
line(50,75,50,120);
line(80,100,70,100);
line(20,100,30,100);
line(40,120,60,120);
line(30,120,70,120);
fill(255,0,0);
popMatrix();


//moon
fill(255,255,0);  
ellipse(350,70,20,20);

//buildings
fill(0,0,0);
rect(400,120,150,150);
rect(400,200,150,150);
fill(255,255,0);
rect(420,250,15,15);
rect(420,200,15,15);
rect(420,150,15,15);
rect(420,300,15,15);
rect(460,300,15,15);
rect(460,250,15,15);
rect(460,150,15,15);
rect(460,200,15,15);
rect(500,250,15,15);
rect(500,200,15,15);
rect(500,150,15,15);
rect(500,300,15,15);

fill(0,0,0);
rect(250,200,150,150);
fill(255,255,0);
rect(260,250,15,15);
rect(290,250,15,15);
rect(320,250,15,15);
rect(350,250,15,15);
rect(385,250,15,15);
rect(260,280,15,15);
rect(290,280,15,15);
rect(350,280,15,15);
rect(385,280,15,15);
rect(320,280,15,15);

fill(0,0,0);
rect(100,100,150,150);
rect(100,200,150,150);
fill(255,255,0);
rect(120,130,15,15);
rect(160,130,15,15);
rect(200,130,15,15);
rect(120,180,15,15);
rect(160,180,15,15);
rect(200,180,15,15);
rect(200,230,15,15);
rect(120,230,15,15);
rect(160,230,15,15);
rect(120,280,15,15);
rect(160,280,15,15);
rect(200,280,15,15);


}
                
                
