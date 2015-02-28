
//example of function in use

void setup(){
stroke(4);

}
int addnumberz(int slotone,int slottwo,int slotthree, int slotfour,int slotfive,int slotsix,int slotseven){
int result = slotone+slottwo+slotthree+slotfour; 
fill(slotseven,slotfive,slotthree);
background(slotone,slotseven,slotfive);
ellipse(slotone,slotsix,counter,counter);
rect(counter,slottwo,slotsix,slotfive);
return result;
}
int counter;
void draw(){
  
int thenumber=addnumberz(40,25,8,6,25,65,85);
println (thenumber);  
counter = counter+1;
if(counter>200)
{
  counter =0;
}
}

