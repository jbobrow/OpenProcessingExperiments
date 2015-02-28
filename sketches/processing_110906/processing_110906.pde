
void setup(){
size(400,400);//define display window size
}

void draw(){
background(200);//set the background colour
sroke(255);//set the stroke colour to white
fill(#CBFFE8);//set the filled colour
smooth();//draw geometric forms smoothly

if(mouseX>50 && mouseY>50){//when mosueX is larger than 50 while mouse Y is smaller than 50
rect(220,0,200,200); //rectagle will be shown
} else if (moouse X <50 && mouseY >50){//when mosueX is smaller than 50 while mouse Y is larger than 50
rect(0,200,200,200); 
} else if (moouse X >50 && mouseY >50){//when mouseX and mouse Y are larger than 50
ellipse(200,200,250,250);//ellipse will be shown
}
}
