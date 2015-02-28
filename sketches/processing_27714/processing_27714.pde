

void setup() {

size (680,680);
smooth();
background(240);


}

void draw() {
//background(240);
fill(245);
ellipse(pmouseX, pmouseY, 25, 25); 
if (mousePressed){strokeWeight(2);
}


  float h = hour();
  float m = minute();
  float s = second();
  
  if (h > 12) {
    h -= 12; 
  }
  
  String time = nf(int(h), 2) + ":" + nf(int(m), 2) + ":" + nf(int(s), 2);
 
  fill(0);
  textSize(12);
  smooth();
  text(time, 500, 500);
  textAlign(CENTER); 

  

  h = map(h, 0, 23, 0, height);
  m = map(m, 0, 59, 0, height);
  s = map(s, 0, 59, 0, height);
 
  
   for (int y = 0; y < height+5; y += 5)  {
//     rect(height/2,width/2, 12, m);
 //random color distribution
if (mousePressed){
  colorMode(RGB, 255, 255, 255);
  float R = random(0, 255);
  float G = random(0, 255);
  float B = random(0, 255);
  fill(R, G, B);
  
  stroke(R+G, G+B, B-R);

strokeWeight(4);
}
  
    smooth();
 fill(130,20,45); 
  rect(620, h, 48, 48);
  rect(620, m, 48,40);
 rect(610,s, 20, 20);   
  
   fill(230);
      
        rect(500,100,s/16,s/16);
        rect(500,200,s/16,s/16);
        rect(500,300,s/16,s/16);
        rect(500,400,s/16,s/16);
        rect(500, 500,s/16,s/16);
//        rect(width/4,height/4,m/8,m/8);
       
   ellipse(width/4,height+m,3,3);
      
     
strokeWeight(2);
ellipse(0,0,s-30,s-30);  
ellipse(0,680, s-90, s-90);
noStroke();
fill(210);
  ellipse(220,s,2,2);
  fill(230,49,20);
    ellipse(s,30,3,3);
    ellipse(s,440,1,1);
     
     
     ellipse(s,150,3,3);     
     ellipse(60,s,1,1);     
     ellipse(s,70,2,2);
     ellipse(80,s,4,4);
     
      ellipse(300,s,2,2);     
     ellipse(350,s,4,4);
     ellipse(325,s,2,2);     
     ellipse(375,s,1,1);
     
         
      ellipse(s,300,2,2);     
     ellipse(s,350,4,4);
     ellipse(s,325,2,2);     
     ellipse(s,275,1,1);
     
       
  ellipse(s,480,3,3); 
  ellipse(s,620,2,2); 
fill(130,20,20);  
  ellipse(s,580,3,3);       
  ellipse(s,600,4,4);  
     
       
     ellipse(190,s,2,2);
     ellipse(55,s,2,2);     
     ellipse(s,60,1,1);
     ellipse(165,s,4,4);
   
     
     ellipse(75,s,1,1);    
     ellipse(s,180,2,2);
     ellipse(s,90,2,2);     
     ellipse(100,s,1,1);
   
  ellipse(480,s,3,3); 
  ellipse(620,s,2,2);           
  ellipse(580,s,3,3);       
  ellipse(600,s,4,4);  


 ellipse(480,s,2,2); 
 ellipse(320,s,4,4);           
 ellipse(380,s,1,1);   
 ellipse(300,s,2,2);   
   }
}


