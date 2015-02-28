
  float r=1;//rotate parameter
  float count_r=30;//rotate angle
  float rule=1.03;
  
  float unit=3;//unite size
  float a = 2.5 + 2 * unit;//short side
  float b = a / sin(radians(45));//long side


int parameter=18;

void setup(){
  smooth();
  size(600,600);
  background(0);
}
void draw(){
  background(0);
  frameRate(30);  
  stroke(255, 30);
  ///////////////////////////////////////////////////////////////////
  float ro = (mouseX / (float) width) * 120f;
  // Convert it to radians
  count_r = degrees(radians(ro));
  
  rule = 1.45-((mouseY / (float) width) * 100f)/230;

//      count_r=count_r+(r/10);
//    if(count_r>120)
//      r=-r;
//    else if(count_r<0)
//      r=-r; 
//      println(count_r);
  ///////////////////////////////////////////////////////////////////
  
    translate(width/2, height/2);
    line(0,0,0,200);
    //rotate(radians(-60));
    //rotate(radians(-count_r));//rotate object
    
    //for(int parameter=12; parameter<24; parameter++);
  ///////////////////////////////////////////////////////////////////
  
    angle_branch(parameter, a, b);


 
    }


void angle_branch(float branch_length, float a, float b){


  float b_x = b*cos(radians(60));
  float b_y = b*sin(radians(60));
  float degree_a = degrees(acos(((branch_length-a)/2)/b));
  float target_x = branch_length*cos(radians(120-degree_a));
  float target_y = -branch_length*sin(radians(120-degree_a)); 
  float branch_length_vr = branch_length; 
  
  branch_length_vr=branch_length*rule;
  
  if(branch_length_vr<35){
    pushMatrix();
    rotate(radians(-count_r));
      line(0,0,a,0);
      line(0,0,-b_x,-b_y);
      line(0,0,target_x, target_y);//parameter
        translate(target_x, target_y);
        rotate(radians(2*degree_a-60));
        line(0,0,a,0);
        line(0,0,-b_x,b_y); 
        angle_branch(branch_length_vr, a, b);    
      popMatrix(); 
//      
    pushMatrix();
    rotate(radians(count_r));
      line(0,0,-a,0);
      line(0,0,b_x,-b_y);
      line(0,0,-target_x, target_y);//parameter
        translate(-target_x, target_y);
        rotate(-radians(2*degree_a-60));
        line(0,0,-a,0);
        line(0,0,b_x,b_y); 
        angle_branch(branch_length_vr, a, b);    
      popMatrix();       
  }
}




