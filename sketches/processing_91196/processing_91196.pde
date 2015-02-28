
color[] desert = {#FEDDFF, #B177B2, #FEC8FF,#98B288, #FFFFFF};  

color[] palette = desert;  

int lf = palette[1];  

int rf = palette[2];  

int s = 100;  

   

void setup(){  

 size(600,  200);  

 smooth();  

rectMode(CENTER);  

noStroke();  

}  

   

void draw(){  

background(palette[4]);  

fill(lf);  

ellipse(width/4, height/4, s, s);  

fill(rf);  

rect(width/2, height/2, s, s);  

if(keyPressed){  

if(key == 'p'){  

lf = palette[3];  

} else {  

lf = palette[1];  

}  

}  

if(key  == 'r'){  

rf = palette[4];  

} else {  

rf = palette [1];  

}  

}  


