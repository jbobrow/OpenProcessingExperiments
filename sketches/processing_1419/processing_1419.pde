
float x=50;
float y=50;
float en=65;
float boy=65;
float hiz=1;


void setup(){
size (600,600);

}

void draw (){
background(247,27,27);
rect(x,y,en,boy);
//x=x+1;
//y=y+2;
x=x+hiz;
if(x>600){hiz=-1;}
if(x<0){hiz=1;}
hiz=hiz*1.053;
}  

void mousePressed (){
 
 
}


