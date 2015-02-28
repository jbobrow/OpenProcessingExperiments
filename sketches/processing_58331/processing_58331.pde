
class pelota{
   pelota(dirx,diry,radio,nume){
   if((nume%2)==0){
      fill(radio+nume,radio*(1+(nume/13)+.25),(radio-5)*(1+(nume/11)+.37));
      ellipse(dirx,diry,radio*1.5,(radio-9)*1.5);
      }
      else{
      fill(radio+nume,radio*1.7,(radio-3)*1.5);
      ellipse(dirx,diry,(radio-5)*(1+(nume/11)+.37),radio*(1+(nume/13)+.25));
      }
      }
      }
pelota balon;
void setup(){
  size(373,419);
  background(53,23,57);
  balon1 = new pelota(211,233,53,1);
  balon2 = new pelota(103,107,41,2);
  balon3 = new pelota(103,293,59,3);
  smooth();
  noStroke();
}
