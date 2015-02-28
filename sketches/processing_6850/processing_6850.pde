
float[][] roots = new float [5000][6];

int num=5000;
float r1=random(0,4);
float r2=random(0,4);
void setup(){

  size(600,600);

  background(255);
  stroke(0);
  smooth();
  frameRate(30);
}



void draw(){
  strokeWeight(.5);

  if(mousePressed==true){
    for(int i=0;i<10;i++){
      
    create_roots();
    }
  }
  update_roots(); 
  draw_roots();
}



void update_roots(){
  for(int root=0 ; root<num ; root++){
    if(roots[root][0]==1){
      roots[root][1]=roots[root][1]+cos(roots[root][3]);
      roots[root][2]=roots[root][2]+sin(roots[root][3]);
      roots[root][3]=roots[root][3]+random(-.1,.1);
    }



  }



}

void draw_roots(){
  for(int root=0 ; root<num ; root++){
    if(roots[root][0]==1){

      point(roots[root][1],roots[root][2]);
    }



  }


}


void create_roots(){
  for(int i=num-1; i>0; i--)
  {
    for(int fireprop=0;fireprop<4;fireprop++)
    {
      roots[i][fireprop]=roots[i-1][fireprop];
    }
  }
    roots[0][0]=1;
    roots[0][1]=mouseX;
    roots[0][2]=mouseY;
    roots[0][3]=random(0,PI*2);
}




