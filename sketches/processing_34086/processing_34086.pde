
import ddf.minim.*;

Minim minim;
AudioInput in;
AudioPlayer player;
float r;
int num = 2000;

float[] ax = new float[num];
float[] ay = new float[num]; //set points to an array,when press 'f', it will starts

void setup(){
  size(800,800);
  smooth();
  minim = new Minim(this);
  player = minim.loadFile("unkleheaven.mp3",2048); // load the mp3 file
  minim.debugOn();
  in = minim.getLineIn(Minim.STEREO,1024);// get a line in from Minim, default bit depth is 16
  background(0);
  //for(int l = 0; l < num; l++) {
    //ax[l] = width/2;
    //ay[l] = height/2;
  //}
  frameRate(30);
  
}

void draw(){
  
  fill(0,3);
  noStroke();
  rect(0,0,width,height);
  
 
  if(key == 'a'){
  
  // draw the waveforms
  for(int i = 0; i < in.bufferSize() -1;i+=8){
    // in.bufferSize() is the Buffer size, it's 1024.
 
    float d = dist(mouseX,mouseY,pmouseX,pmouseY);
    stroke(random(255),random(255),random(255));
    strokeWeight(d); //make the strokeweight random by mouse
    
    //Left channel frequency
    fill(random(255),random(255),random(255),random(100));
    ellipse(i,240+in.left.get(i)*100,in.left.get(i)*100,in.left.get(i)*100);
    
    //Right channel frequency
    fill(random(255),random(255),random(255),random(100));
    ellipse(i,500+in.right.get(i)*100,in.right.get(i)*100,in.right.get(i)*100);
  }
    
    
    stroke(random(255),random(255),random(255));
    float d2 = dist(mouseX,mouseY,pmouseX,pmouseY);
    strokeWeight(d2);
    line(mouseX,mouseY,pmouseX,pmouseY); //draw a line , strokeweight is randomed by mouse
  
  }
  
  
  
  
    else if(key == 'b'){
  
    for(int i = 0; i < in.bufferSize() -1;i+=8){
    float d = dist(mouseX,mouseY,pmouseX,pmouseY);
    strokeWeight(d);
    stroke(random(255),random(255),random(255));
    fill(random(255),random(255),random(255),random(100));
    rect(i,240+in.left.get(i)*100,in.left.get(i)*100,in.left.get(i)*100);
    
    fill(random(255),random(255),random(255),random(100));
    ellipse(i,500+in.right.get(i)*100,in.right.get(i)*100,in.right.get(i)*100);
  }


    stroke(random(255),random(255),random(255));
    float d2 = dist(mouseX,mouseY,pmouseX,pmouseY);
    strokeWeight(d2);
    line(mouseX,mouseY,pmouseX,pmouseY);  

}
  
    else if(key == 'c'){
  
    for(int i = 0; i < in.bufferSize() -1;i+=200){
    float d = dist(mouseX,mouseY,pmouseX,pmouseY);
    strokeWeight(d);
    stroke(random(255),random(255),random(255));
   
     float m = millis();
     
     fill(m % 255,m % 255,m % 255,m % 255);
     ellipse(i,240+in.left.get(i)*100,in.left.get(i)*100,in.left.get(i)*300);
    
    
    stroke(random(255),random(255),random(255),random(100));
    line(mouseX,mouseY,in.right.get(i)*600,in.right.get(i)*600);
  }
 

}



  else if(key == 'd'){
  player.play(); // play the mp3 file
  fill(0,20);
  rect(0,0,width,height);
  stroke(33);
  translate(width/2,height/2);
  //noStroke();
  rotate(r);
  
  float angle = 1440 * float(mouseY)/float(height);
  rotate(radians(angle));
  
  for(int i=0;i<400;i++){
  fill(random(i),0,0);
  rotate(radians(360/50)*i);
  //rect(i*1.5,0,100-i,100-i);
  fill(i+255,i*7,i*50,i);
  ellipse(i*10,0,100 + player.left.get(i)*500,100 + player.left.get(i+1)*100);

  
    }
  }  
  else if(key == 'f'){
      // Shift all elements 1 place to the left
  for(int l = 1; l < num; l++) {
    
    for(int i=0;i<400;i++){
    ax[l-1] = ax[l];
    ay[l-1] = ay[l];
  

  // Put a new value at the end of the array, and make it depend on the player's frequency.
  ax[num-1] += random(-player.left.get(i)*500, player.left.get(i+1)*500);
  ay[num-1] += random(-player.left.get(i)*500, player.left.get(i+1)*500);

  // Constrain all points to the screen
  ax[num-1] = constrain(ax[num-1], 0, width);
  ay[num-1] = constrain(ay[num-1], 0, height);

}
  }
  
  // Draw a line connecting the points
  for(int l=1; l<num; l++) {    
    //float s = float(l)/num * 204.0+ 51;
    stroke(255);
    line(ax[l-1], ay[l-1], ax[l], ay[l]);
  }
    
  
  }  
    
  else{
    noStroke();
    for(int i = 0; i < in.bufferSize() -1;i+=8){
    fill(random(255),random(255),random(255),random(100));
    ellipse(random(800),240+in.left.get(i)*100,in.left.get(i)*100,in.left.get(i)*100);
    
    fill(random(255),random(255),random(255),random(100));
    ellipse(random(800),500+in.right.get(i)*100,in.right.get(i)*100,in.right.get(i)*100);
  }
  
  
    stroke(random(255),random(255),random(255));
    float d2 = dist(mouseX,mouseY,pmouseX,pmouseY);
    strokeWeight(d2);
    line(mouseX,mouseY,pmouseX,pmouseY);
    
}




}

void stop(){
    
    // always close Minim audio classes when done with them
  
    in.close();
    minim.stop();
    super.stop();
  
}


void mousePressed(){

    background(0); // clear the canvas.


}

void keyPressed(){
  
 if(key == 's')
 save("mydrawing.jpg"); 
  
  
  
}

