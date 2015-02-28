
void setup () {
    size(500,500);
    for(int x=0; x<=500; x=x+3)
 {
    ellipse(10%x+250,10%x+250,500%x,500%x);
    ellipse(10%x+250,10%x+250,500%x,10%x);
    line(x,0,x,500);
 }           
}    
