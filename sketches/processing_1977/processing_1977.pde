

size(600,600); 
background(255); 
stroke(0); 
noFill(); 

int i = 0;

while (i <10) {
rect(width/8,height/8, i*60, i*60);
rect (  i*60,  i*60,width/8,height/8);
rect ( width/8,i*60,i*60,height/8);
rect (i*60,width/8,height/8, i*60);
i++;
}


