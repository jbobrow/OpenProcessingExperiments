
float cabX = 0;
float cabY = 360;
float cabWidth;
float cabHeight;
color cabColor;

void setup(){
  size(1000,600);
}

void draw(){

    background(64,64,64);
  
  //zebra crossing
  strokeCap(SQUARE);
  strokeWeight(30);
  stroke(255);
  line(600,125,750,125);
  line(600,185,750,185);
  line(600,245,750,245);
  line(600,305,750,305);
  line(600,365,750,365);
  line(600,425,750,425);
  line(600,485,750,485);
  
  //double yellow line
  strokeWeight(3);
  stroke(255,222,0);
  line(0,112,1000,112);
  line(0,120,1000,120);
  line(0,488,1000,488);
  line(0,480,1000,480);
  
  //pavement
  strokeWeight(20);
  stroke(128,128,128);
  line(0,100,1000,100);
  line(0,500,1000,500);
  
  //road divider
  strokeCap(SQUARE);
  strokeWeight(5);
  stroke(255);
  line(50,300,100,300);
  line(150,300,200,300);
  line(250,300,300,300);
  line(350,300,400,300);
  line(450,300,500,300);
  line(550,300,600,300);
  line(650,300,700,300);
  line(750,300,800,300);
  line(850,300,900,300);
  line(950,300,1000,300);
  
  //yellowcab
 cabColor=color(255,196,0);
 cabWidth=150;
 cabHeight=cabWidth/3;
 
 cabX=(cabX+1)%(width+cabWidth);
 
 //upper
  noStroke();
 fill(cabColor);
 rect(-cabX,cabY-180, cabWidth, cabHeight,7);
 rect(-cabX+200,cabY-180, cabWidth, cabHeight,7);
 rect(-cabX+550,cabY-180, cabWidth, cabHeight,7);
 rect(-cabX+750,cabY-180, cabWidth, cabHeight,7);
 rect(-cabX+930,cabY-180, cabWidth, cabHeight,7);

 fill(255);
 rect(-cabX+80,cabY+cabHeight/4-180,cabWidth/20,cabHeight/2);
 rect(-cabX+280,cabY+cabHeight/4-180,cabWidth/20,cabHeight/2);
 rect(-cabX+630,cabY+cabHeight/4-180,cabWidth/20,cabHeight/2);
 rect(-cabX+830,cabY+cabHeight/4-180,cabWidth/20,cabHeight/2);
 rect(-cabX+1010,cabY+cabHeight/4-180,cabWidth/20,cabHeight/2);
 
 //lowers
 noStroke();
 fill(cabColor);
 rect(cabX,cabY, cabWidth, cabHeight,7);
 rect(cabX+200,cabY, cabWidth, cabHeight,7);
 rect(cabX+550,cabY, cabWidth, cabHeight,7);
 rect(cabX+750,cabY, cabWidth, cabHeight,7);
 rect(cabX+930,cabY, cabWidth, cabHeight,7);

 fill(255);
 rect(cabX+80,cabY+cabHeight/4,cabWidth/20,cabHeight/2);
 rect(cabX+280,cabY+cabHeight/4,cabWidth/20,cabHeight/2);
 rect(cabX+630,cabY+cabHeight/4,cabWidth/20,cabHeight/2);
 rect(cabX+830,cabY+cabHeight/4,cabWidth/20,cabHeight/2);
 rect(cabX+1010,cabY+cabHeight/4,cabWidth/20,cabHeight/2);
 
 //pedestrian
 fill(153,76,0);
 ellipse(mouseX,mouseY,20,20);

 
 if(keyPressed){
   if(key=='s'){
     saveFrame();
   }
} 

}



