
size(100, 100, P3D);
frameRate(10);
size(100, 100, P3D);
noFill();
boolean b=true;
while(b=true){
beginCamera();
camera();
rotateX(-PI/60);
endCamera();

translate(50, 50, 0);
rotateY(PI/3);
box(45);

}



