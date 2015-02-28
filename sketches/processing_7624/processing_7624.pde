

// setup() {
size(800,600,JAVA2D);
smooth();
//}

int beat=0;
//void draw() {
  background(0);                    //solid bg
  //background(random(180,255),0,random(180,232));    //pink random bg
  for(int i=0;i<13;i++) {
    noFill();
    //stroke(255,0,0);         //red lines
    stroke(random(i*40));  //black lines
    strokeWeight(random(0,i*0.05));
    bezier(random(width,width*2),random(height,-height),random(width*2),random(height*2),random(0,-width),random(0,-height),random(0,-width),random(-height,height));
  }
  for(int i=0;i<700;i++) {  
    float rand=random(0,i%100);
    
    stroke(random(i*0.3%255,i*0.5%255),0,random(i*0.5%255),i*5%255);  //red heart
    //stroke(random(rand+10,rand*2+100),rand*2);  // B+W heart
    noFill();
    strokeWeight(abs(rand*0.0001));

    bezier(width/2+rand+beat,height*.266+random(i*0.6),width*0.25,0,width*0.25,width*0.266,width/2-rand+beat,height*0.53);
    bezier(width/2+rand-beat,height*.266,width*0.75,0,width*0.75,width*0.266,width/2-rand*0.5-beat,height*0.53+random(i*0.2));
  }
//}

