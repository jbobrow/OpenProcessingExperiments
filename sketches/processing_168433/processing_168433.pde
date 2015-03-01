
/*
By Adriano Parracciani
aka CyberParra
*/


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
}void setup() {
  size(270,270);
  frameRate(1);
  strokeWeight(3);
}
  
  void draw() {
   // colonna 1
    fill(255);
    rect(10,10,40,40);//riga1 sx
    rect(50,10,80,40);//riga1 mid    
    rect(10,50,20,80);//riga2sx
    
    fill(random(255), random(255), random(255));
    rect(30,50,80,80);//riga2mid
    
     fill(255);
    rect(110,50,20,80);//riga2dx
    
    
    fill(random(255), random(255), random(255));
    rect(10,130,30,60);//riga3sx
    rect(40,130,30,60);//riga3dx
    
    fill(255);
    rect(10,190,60,60);//riga4sx
    
    
    fill(random(255), random(255), random(255));
    rect(70,130,60,120);//big sx
  fill(random(255), random(255), random(255));
    rect(130,10,60,120);//big dx
    
      // colonna 2
      fill(random(255), random(255), random(255));     
      rect(190,10,60,60);//riga1sx
      fill(255);
      rect(190,70,30,60);//riga2sx
      rect(220,70,30,60);//riga2sx
      
      rect(130,130,20,80);//riga3sx
      
     fill(random(255), random(255), random(255));
      rect(150,130,80,80);//riga3mid
      fill(255);
      rect(230,130,20,80);//riga3dx
     fill(random(255), random(255), random(255));
      rect(130,210,80,40);//riga4sx
     fill(random(255), random(255), random(255));
      rect(210,210,40,40);//riga4mid
      
        
  }
