

float sc=2;
float unit=3;//unite size
float r=1;//rotate parameter
float count_r=45;//rotate angle
float a = 2.5*sc + 2 * unit*sc;//short side
float b = a / sin(radians(45));//long side
float parameter=16*sc;
float parameter_end=parameter+1*sc*12;
int  rotatee=0;
Can[] can = new Can[20];

void setup(){
   for(int i=0; i<can.length; i++){
   can[i] = new Can(30+70*i, height-(height/20), 50);
 }
  smooth();
  size(800,800);
  background(0);
}

void draw(){
  rotatee=0;
  background(0);
  stroke(255);
  line(0,95, width, 95);
  line(0,144, width, 144);  
  
   for(int i=0; i<can.length; i++){

   if((i>0)&&can[i-1].isFilled()||(i<can.length-1)&&can[i+1].isFilled()){
     can[i].update();}
  
   else{
      can[i].de_mouse(); }
         can[i].show();}
  
  
  

  
  pushMatrix();
    translate(300, 500);
    rotate(radians(-60));
    //rotate(radians(count_r));
    //rotate(radians(-count_r));//rotate object
    
    //for(int parameter=12; parameter<24; parameter++);
    angle_branch(parameter, a, b);
  
  
  popMatrix();
 


    count_r=count_r+(r/10);
    if(count_r>120)
      r=-r;
    else if(count_r<1)
      r=-r;  
    }


void angle_branch(float branch_length, float a, float b){
  //float mousex = mouse_x;
  //float mousey = mouse_y;
  float b_x = b*cos(radians(60));
  float b_y = b*sin(radians(60));
  float degree_a = degrees(acos(((branch_length-a)/2)/b));
  float target_x = branch_length*cos(radians(120-degree_a));
  float target_y = -branch_length*sin(radians(120-degree_a)); 
  float branch_length_vr = branch_length; 
  float branch_a_a_x = a*cos(radians(120-degree_a));
  float branch_a_a_y = -a*sin(radians(120-degree_a));
  int rot=1;
  //float disX = target_x/2 - mouse_y;
  //float disY = target_y/2 - mouse_y; 
  
  pushMatrix();
  
  //println(radians(can[1].degree()));
  rotate(-radians(can[rotatee].degree()));
  rotatee=rotatee+1;
    stroke(160);
    line(0,0,a,0);
    line(0,0,-b_x,-b_y);
    fill(10,30,220,120);
    noStroke();

      
    fill(255);
    stroke(160);
    line(0,0,target_x, target_y);//parameter
    pushMatrix();
      translate(target_x, target_y);
      rotate(radians(2*degree_a-60));
      line(0,0,a,0);
      line(0,0,-b_x,b_y); 
      
         //if(sqrt(sq(disX) + sq(disY)) < branch_length/2 )
      //ellipse(target_x/2, target_y/2,branch_length,branch_length); 
     
     branch_length_vr=branch_length+1*sc;
     if(branch_length_vr<(parameter_end))
     angle_branch(branch_length_vr, a, b);    
      
    popMatrix(); 
  popMatrix();     
}

boolean overRect(float x, float y, float width, float height) 
{
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

class Can {
 private boolean isFilled = false;
 private float x = 0;
 private float y = 0;
 private float w = 0;
 private float tempw = 0;
 private int delta = 1;

 public Can(float x, float y, float w){  //constructor
   this.x = x;
   this.y = y;
   this.w = w;
 }

 public void de_mouse(){
   if(overRect(x, y, w, w)){
   tempw = tempw + delta;
   if(tempw >= w){
     tempw = w;
     isFilled = true;
   }
 }
else if((tempw>0)){
   tempw = tempw - delta;
   isFilled = false;}
 }

 public void update(){
   tempw = tempw + delta;
   if(tempw >= w){
     tempw = w;
     isFilled = true;}
 
 }
 public void show(){
   noStroke();
   fill(255, 0, 0);
   rect(x, y, tempw, w);
 }

 public boolean isFilled(){
   return isFilled;
    }
 public float degree(){
 return tempw;

 }
}



