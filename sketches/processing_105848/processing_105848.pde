
int num_circle = 7;
float circle_size;
float [] x = new float [num_circle];
float [] y = new float [num_circle];

void setup(){
  background(0,211,199);
//  if(frame != null)
//    frame.setResizable(true);
    
  size(500,500);
  
  smooth();
}

void draw(){
  circle_size = dist(0,0,width,height) /( 2.2 * num_circle);
  
  ellipseMode(CENTER);
  for(int j=0; j< num_circle; j++){
     y[j] = (height/(num_circle+1)) * (j+1);
    for(int i=0; i<num_circle; i++){
      x[i] = (width/(num_circle+1)) * (i+1);
    }
  } 
  
  fill(255);
  stroke(0,211,199);
  
  draw_circle(); 
  
  }

void draw_circle(){
  for(int j=0; j < num_circle; j++)
    for(int i=0; i < num_circle; i++){
      if(dist(mouseX, mouseY, x[i],y[j]) < circle_size/2){
         circle_effect(i,j);
      }else{
       fill(255);
      ellipse(x[i] , y[j], circle_size, circle_size);
      }
    } 
}

void circle_effect(int m, int n){
  fill(254,255,0);
  for(int i = (int)circle_size; i >= (int)(circle_size * 0.7); i--){
    ellipse(x[m], y[n], i, i);
  }
}



