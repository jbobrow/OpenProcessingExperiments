

float contador =0;
int num = 55;
int [] x = new int [num];
int [] y = new int [num];
void setup(){ 
  size (800,800);
  background(0); 
  smooth();
  noStroke();
}
void draw (){
  fill(random(219), random(145), random(137));
  for (int i = num-1; i > 0 ; i--) {
    x[i] = x[ i-1];
    y[i] = y[ i-1];
    
    x[0] = mouseX;
    y[0] = mouseY;
  }
  for (int i=0; i<num; i++   ) {

   ellipse( x[i],y[i], i/1.0, i/1.0);
   
     rect( x[i],y[i], i/2.0, i/2.0);
   //ellipse( x[i],y[i], i/5.0, i/5.0);}
    //triangle(x[i],y[i],50,20, i/2.0, i/2.0);}
} 
  colorMode(HSB,390,100,100);
  if(mouseX<=250){
    fill(719,90,9,70);
  }
 
  
  else {
    fill (354,92,97,50);
    if (mousePressed){
      fill(random(560),60,350,150);
      
      ellipse(random(width),random(height),45,45);
    }
    else{
      if(mouseY<=200){
      fill(255,54,42);
      rect(0,0,800,800);
    }
  }
  }
  ellipse(width/2,height/2,150,150);
  ellipse(150,150, 150,150);
  ellipse(600,600,150,150);
}


