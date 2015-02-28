
size(200,200); 
background(#368685);
smooth(); 
stroke(#3B8E8D);
translate(width/2, height/2); 
for (int i=0;i<360;i+=30){
rotate(radians(30)); 
quad(0, 0, 30, 15, 70, 60, 20, 10);
}


