
//Space by Vesselina Ivanova

float r=0;
float down=0;
float starY;
float fade;

void setup(){
  size(1000,500);
  smooth();
  strokeWeight(.1);
  background(0);
}

void draw(){
  //Sun left
  if(mouseX<=500 && mousePressed){
    for(down=0;down<500;down=down+15){
      for(r=0;r<500;r=r+15){
      stroke(random(255),random(200),random(100),random(100));
      line(-50,250,r,down);
      }
    }
    fade++;
    fill(255,236,64,random(255));
    noStroke();
    ellipse(-50,250,400*sin(fade),400*sin(fade));
    
  }else if(mouseX>=500 && mousePressed){
    noStroke();
    fill(227,224,135,255);
    ellipse(770,200,70,70);
    fill(0);
    ellipse(780,200,70,70);
    for(starY=500;starY<1000;starY=starY+20){
      noStroke();
      fill(random(255),random(255),random(255),random(255));
      ellipse(random(500,1000),random(starY),1,1);
    }
  }
  if(mouseX>500 && mousePressed==true){
    fill(random(100));
    ellipse(mouseX+20,mouseY+20,4,4);
  }
  
  //Earth & clouds
  stroke(255);
  fill(21,185,118,150);
  ellipse(width/2, height/2,150,150);
  fill(255,255,255,100);
  ellipse(530,285,140,25);
  ellipse(510,268,150,38);
  ellipse(455,220,100,36);
  ellipse(460,239,80,15);
  ellipse(530,207,120,28);
  ellipse(465,299,90,17);
  ellipse(450,190,50,10);
  ellipse(530,180,45,9);
  ellipse(535,315,55,15);
}
