
void setup(){
  size(500,500);
  smooth();
  background(0,0,255);
}

void draw(){
//reference lines
  stroke(0);
  line(0,height/4,width,height/4);
  line(0,height/2,width,height/2);
  line(0,height*3/4,width,height*3/4);
    
    stroke(255,0,0);
    float x = 0;
    while(x < width) {
      point(x,height/4+random(-50,50));             //random(-50,50); between -50 and 50
      point(x,height/2+20 * noise(x/100));          //noise(); noise between 0 and 1
      point(x,height*3/4 + 40 *sin(x/30));          // sin(); between -1 and 1 
      x++;
    }
  

}
