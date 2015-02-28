
size(400,400); 
background(#368685);
smooth(); 
stroke(#3B8E8D);
translate(width/2, height/2); 
for (int i=0;i<360;i+=30){
rotate(radians(30)); 
quad(10, 100, 30, 15, 200, 60, 20, 10);
}


