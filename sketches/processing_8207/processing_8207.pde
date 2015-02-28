
class Automata
{
  PGraphics atmt; 
  int[] rer = {0,1}; 
  int[] rules = new int[8]; 
  color on = color(255, 200); 
  color off = color(0, 200); 
  int gen; 
  
  Automata()
  {
    atmt = createGraphics(251, 251, P2D);
    startAutomata();
  }
  
  void render()
  {
    atmt.beginDraw();  
    for(int i = 1; i<atmt.width-1; i++){ 
      int left = atmt.get(i-1, gen-1); //-1 
      int me = atmt.get(i, gen-1); //current px 
      int right = atmt.get(i+1, gen-1); //+1 
      if (rules(left, me, right) == 1) { 
        atmt.set(i, gen, on); 
      } 
    } 
    gen ++; //increment gen by 1 
    atmt.endDraw();   
  }

  int rules(color a, color b, color c){ 
    if((a==on) && (b==on) && (c==on)){ return rules[0]; } 
    if((a==on) && (b==on) && (c==off)){ return rules[1]; } 
    if((a==on) && (b==off) && (c==on)){ return rules[2]; } 
    if((a==on) && (b==off) && (c==off)){ return rules[3]; } 
    if((a==off) && (b==on) && (c==on)){ return rules[4]; } 
    if((a==off) && (b==on) && (c==off)){ return rules[5]; } 
    if((a==off) && (b==off) && (c==on)){ return rules[6]; } 
    if((a==off) && (b==off) && (c==off)){ return rules[7]; } 
    return 0; 
  } 

  void startAutomata() 
  { 
   gen=1; 
   populateRules(); 
   for(int w = 0; w < atmt.width; w++){ 
     for(int h = 0; h < atmt.height; h++){ 
       atmt.set(w,h,off); 
     } 
   } 
   atmt.set((int) random(1, width-1), 0, on); 
  } 
  
  void populateRules() 
  { 
    for(int i = 0; i<8; i++){ 
      int appo = (int) random(rer.length); 
      int tt = rer[appo]; 
      rules[i] = tt; 
    } 
  } 
}


