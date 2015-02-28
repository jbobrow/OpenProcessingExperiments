
size(500,500);
translate(width/2, height/2);
smooth();
for(int i=0; i<360; i+=30){
rotate(radians(30));
quad(0,0,25,30,27,32,50,50);
fill(0);
ellipse(55,55,5,5);
}
