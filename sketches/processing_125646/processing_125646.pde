
//Based on 'Yes No' code by Casey Reas
//Processing 2.0

float mSize=5;            //detail size
int[] list;
int side=100;             //initial horizontal position
int top=70;               //initial vertical position
int currentSlash;
int upperSlash;
int arraySize;

void setup(){
  size(600,800);
  background(255,250,245);
  stroke(51);
  for(int y=top; y <height-top; y+=mSize){          //condition to get arraysize and maze dimensions
    upperSlash=0;
    for(int x =side; x < width-side; x +=mSize){
      arraySize++;
      upperSlash++;
    }
  }
  list = new int[arraySize];
}

void draw(){
  if(mouseX-pmouseX != 0){                          //mouse position updates maze layout
    background(255,250,245);
    for(int y=top; y <height-top; y+=mSize){        //
      for(int x =side; x < width-side; x +=mSize){  //this loops avoid squares to be drawn, see original code for comparison
        int q1 = currentSlash-upperSlash;
        if(q1<0){ q1=0; }
        int q2 = currentSlash-upperSlash-1;
        if(q2<0){ q2=0; }
        int q3 = currentSlash-1;
        if(q3<0){ q3=0; }
        if(list[q1]==1 && list[q2]==0 && list[q3]==1){   line(x,y,x+mSize,y+mSize); list[currentSlash]=1;   }
        else if(random(1)>0.5){   line(x,y,x+mSize,y+mSize); list[currentSlash]=1;   } 
        else {   line(x,y+mSize,x+mSize,y); list[currentSlash]=0;   }
        currentSlash++;
        if(currentSlash>arraySize-1){  currentSlash=0;  }
      }
    }
  }
}



//original code by Casey Reas
/* 
int p = 10;
size(900,900);
background(240);
for(int y=75; y <height-100; y+=p){
  for(int x =75; x < width-100; x +=p){
    if(random(1)>0.5){ line(x,y,x+p,y+p); } 
    else { line(x,y+p,x+p,y); }
  }
}
*/


