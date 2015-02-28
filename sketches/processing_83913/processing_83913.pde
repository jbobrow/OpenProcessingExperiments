
int blocksize;
int variable=0;
int variable2=0;

void setup() {

size(460,200);

blocksize = 10;

noStroke();

}


void draw() {

for(int y=0; y<height; y+=blocksize) {

for(int x=0; x<width;x+=blocksize) {

fill(random(0,255),random(0,550), random(100), 50);
noStroke();
rect(x,y,80,80);

 do{
    fill(random(255),0,0);
    ellipse(variable2,variable,30,10);
    variable+=10;
    if(variable>height){
    variable=0;
    variable2=variable2+10;
    }
    if(variable2>=width){
      variable=0;
      variable2=0;
    }
   }while(0!=0);
}  
}

}





