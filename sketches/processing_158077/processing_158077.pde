
int px=0;
void setup(){
size(600,400);


}
void draw(){
ellipse(px,200,10,10)
ellipse (100,50,20,20);
ellipse (50,20,10,10);
ellipse (200,40,10,10);
ellipse (mouseX,mouseY,20,20)

px++;
if(px<width/2){
fill (255,0,0);
}else{
fill (0,255,0);
println(mousePressed);

}
}
