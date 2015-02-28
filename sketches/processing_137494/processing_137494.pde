
//I prefer using integers- nice and simple
int x=1;
float a= 0.0;

void setup () {
size(700, 700); 
}

void draw () {
background (0);
noStroke();
fill (225,200);
ellipse(width*1.0, height*0.0, width*0.2, height*0.96); 
ellipse(width*0.9, height*0.1, width*0.2, height*0.96); 
ellipse(width*0.8, height*0.2, width*0.2, height*0.96); 
ellipse(width*0.7, height*0.3, width*0.2, height*0.96); 
ellipse(width*0.6, height*0.4, width*0.2, height*0.96); 
ellipse(width*0.5, height*0.5, width*0.2, height*0.96); 
ellipse(width*0.4, height*0.6, width*0.2, height*0.96); 
ellipse(width*0.3, height*0.7, width*0.2, height*0.96); 
ellipse(width*0.2, height*0.8, width*0.2, height*0.96); 
ellipse(width*0.1, height*0.9, width*0.2, height*0.96); 
ellipse(width*0.0, height*1.0, width*0.2, height*0.96); 

noStroke();
fill (225,200);
ellipse(width*0.0, height*0.0, width*0.2, height*0.96); 
ellipse(width*0.1, height*0.1, width*0.2, height*0.96); 
ellipse(width*0.2, height*0.2, width*0.2, height*0.96); 
ellipse(width*0.3, height*0.3, width*0.2, height*0.96); 
ellipse(width*0.4, height*0.4, width*0.2, height*0.96); 
ellipse(width*0.5, height*0.5, width*0.2, height*0.96); 
ellipse(width*0.6, height*0.6, width*0.2, height*0.96); 
ellipse(width*0.7, height*0.7, width*0.2, height*0.96); 
ellipse(width*0.8, height*0.8, width*0.2, height*0.96); 
ellipse(width*0.9, height*0.9, width*0.2, height*0.96); 
ellipse(width*1.0, height*1.0, width*0.2, height*0.96); 

println (x+3 + " I'm a integer");
println (a+7 + " I'm a float");
}



