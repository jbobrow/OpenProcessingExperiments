
//an arraylist for all the particles
ArrayList points = new ArrayList();
 
void setup(){
  //drawing size
  size(400,800);
  //background colour (white)
  background(255);
  //anti-aliasing
  smooth();
}
 
void draw(){
  //particle birth position (random points within the drawing, spread by a semi-determined amount)
  for(int f=0; f<500; f+=1){points.add(new birthpoint(random(0,width),random(0,height)) ); }
  for(int i=points.size()-1; i>0; i--){
    birthpoint p = (birthpoint)points.get(i);
    p.partpath(); }
}
 
class birthpoint {
  float x,y,xv,yv;
 
  birthpoint(float x, float y){
    this.x = x;
    this.y = y;
  }
 
  void partpath(){
    //particle colour
    stroke(0,50);
    //particle shape generation
    this.xv = cos(  noise(this.x*.05,this.y*.05)*PI);
    this.yv = tan(  noise(this.x*.0001,this.y*.0001));

    this.x += this.xv;
    this.y += this.yv;
 
    line(this.x+this.xv, this.y+this.yv,this.x,this.y );
  }
 
}

