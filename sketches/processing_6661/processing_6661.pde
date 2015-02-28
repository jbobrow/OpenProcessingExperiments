

float sc=2;
float unit=3;//unite size
float r=1;//rotate parameter
float count_r=45;//rotate angle
float a = 2.5*sc + 2 * unit*sc;//short side
float b = a / sin(radians(45));//long side
float parameter=14*sc;
float parameter_end=parameter+2*sc*9;

float theta;

void setup(){
  smooth();
  size(600,600);
  background(0);
}

void draw(){
  background(0);
  stroke(255);
  
//  float a = (mouseX / (float) width) * 90f;
//  // Convert it to radians
//  theta = radians(a);
//  count_r = theta;
  
  pushMatrix();
    translate(200, 320);
    rotate(radians(-60));
    rotate(radians(count_r));
    //rotate(radians(-count_r));//rotate object
    
    //for(int parameter=12; parameter<24; parameter++);
    angle_branch(parameter, a, b);
  
  
  popMatrix();
 


    count_r=count_r+(r/6);
    if(count_r>120)
      r=-r;
    else if(count_r<0)
      r=-r;  
    }


void angle_branch(float branch_length, float a, float b){
  float b_x = b*cos(radians(60));
  float b_y = b*sin(radians(60));
  float degree_a = degrees(acos(((branch_length-a)/2)/b));
  float target_x = branch_length*cos(radians(120-degree_a));
  float target_y = -branch_length*sin(radians(120-degree_a)); 
  float branch_length_vr = branch_length; 
  pushMatrix();
  rotate(radians(-count_r));
    line(0,0,a,0);
    line(0,0,-b_x,-b_y);
    line(0,0,target_x, target_y);//parameter
    pushMatrix();
      translate(target_x, target_y);
      rotate(radians(2*degree_a-60));
      line(0,0,a,0);
      line(0,0,-b_x,b_y); 
     
     branch_length_vr=branch_length+2*sc;
     if(branch_length_vr<(parameter_end))
     angle_branch(branch_length_vr, a, b);    
      
    popMatrix(); 
    

    
  popMatrix();     
}




