
void setup()
{
size(700,700);
background(#F5C6C6);
}

void draw()
{
strokeWeight(1);

if(mousePressed)
{
line(pmouseX,pmouseY,mouseX,mouseY);
}

if(keyPressed){
  
if(key=='a'){
stroke(#FC0000);    
}
  
if(key=='b'){
stroke(#FC00CF);
}

if(key=='c'){
stroke(#7900FC);
}

if (key=='d'){
stroke(#007CFC);
}

if (key=='e'){
stroke(#00F2FC);
}

if(key=='f'){
stroke(#00FC0A);
}

if(key=='h'){
stroke(#FCFC00);
}

if(key=='i'){
stroke(#F07A6F);
}

if(key=='j'){
stroke(#4F5993);
} 
}
}
