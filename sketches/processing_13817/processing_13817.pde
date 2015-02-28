
void setup(){
size(600,140);
background(0);

}

void draw(){
stroke(250);
strokeWeight (0.1);    //왜안얇아지지..

for(int a = 0; a < 600; a = a+5){
for(int s = 0; s < 140; s = s+5){

point(a,s);

line(300,70,a,s);


//line(0, 70, 50, 70);

}
}

}


