
  PImage questbackground;
  float futures_handle_offset = new float[6];
  float futures_handle_array = round(random(0,6));
  int strikes = 11;
  float small_call_strike = 123.0;
  float small_put_strike = 123.0;
  int call_strike_placement = 20;
  int call_bid_placement = 20;
  int call_tick_placement = 30;
  int put_tick_placement = 30;
  int put_strike_placement = 20;
  int put_bid_placement = 20;
  int strike_offset = 60;
  int answer_bid_points = 0;
  int answer_bid_ticks = 0;
  int answer_ask_points = 0;
  int answer_ask_ticks = 0;
  int call_i = round(random(2,10));
  int put_i = round(random(2,10));
  int straddle_i = round(random(1,9));
  int win = 3;
 

void setup(){
  size(750,750);
  font = loadFont("FFScala.ttf");
  noLoop();
  questbackground = loadImage ( "optionstrading.jpg" );
}

void draw(){
  
   for(i = 0; i <= 6; i++){
    futures_handle_offset[i] = -2.5 + (i);
    }
  int last_futures_handle = round(128.5 + futures_handle_offset[futures_handle_array]);
  float last_futures_ticks = round(random(31));
  int last_futures_bid = 0;
  
  fill(200);
  rect(0,0,width,height);
  fill(0);
  rect(0,75,1000,225); 
  strokeWeight(5);
  line(0,24,1000,24);
  int[] call_ask_ticks = new int[strikes];
  int[] call_bid_ticks = new int[strikes];
  int[] put_ask_ticks = new int[strikes];
  int[] put_bid_ticks = new int[strikes];
  float[] call_strike = new float[strikes];
  int[] call_bid_points = new int[strikes];
  float[] put_strike = new float[strikes];
  int[] put_bid_points = new int[strikes];
  int[] straddles = new int[strikes - 2];
   
  for(i = 250; i <= 750; i += 250){
  line(i,25,i,75);
  }
  
  //Header
  textFont (font , 20);
  fill(0,135,216);
  text("30-Year U.S. Treasury Bond Futures, USFM",5,20);
  
  //Futures Prices
    //Last
  textFont (font , 32);
  fill(0);
  text("Last:",5,60);
  text(nf(last_futures_handle,3),90,60);
  text("-",150,60);
  text(nf(last_futures_ticks,2),165,60);
    //Bid
  textFont (font , 32);
  fill(34,167,48);
  text("Bid:",255,60);  
  text(nf(last_futures_handle,3),340,60);
  text("-",400,60);
  if (last_futures_ticks > 0){
  text(nf(last_futures_ticks-1,2),415,60);
  }
  else{
    text(nf(last_futures_ticks,2),415,60);
  }
    //Ask
  textFont (font , 32);
  fill(216,0,0);
  text("Ask:",505,60);
  if (last_futures_ticks < 31){
  text(nf(last_futures_handle,3),590,60);
  text("-",650,60);
  text(nf(last_futures_ticks+1,2),665,60);
  }
  else{
  text(nf(last_futures_handle,3),590,60);
  text("-",650,60);
  text(nf(last_futures_ticks,2),665,60);
  }
  
  //Start of Options Legs
  textFont (font , 20);
  fill(200);
  text("USM4 (June 2014 Expiration)",5,95);
 
  //Calls
  textFont (font , 32);
  fill(34,167,48);
  text("Calls",14,125);
  
  
  for(int i = 0; i <= strikes; i++){
  call_strike[i] = small_call_strike;
  small_call_strike += 1;
  }
  
  for(int i = 0; i <= strikes; i++){
  textFont (font , 16);
  fill(34,167,48);
  text(nf(call_strike[i],3),call_strike_placement,150);
  if(call_strike_placement < 700){
  call_strike_placement += strike_offset;
  }}
  
 
  for(int i = 0; i <= strikes; i++){
  if(last_futures_handle - call_strike[i] > 0){
  call_bid_points[i] = nf((last_futures_handle - call_strike[i]));
  textFont (font , 14);
  fill(200);
  text(call_bid_points[i],call_bid_placement,170);
  text(call_bid_points[i],call_bid_placement,190);
  call_bid_placement += strike_offset;
  }
  else{
  textFont (font , 14);
  fill(200);
  text(0,call_bid_placement,170);
  text(0,call_bid_placement,190);
  call_bid_placement += strike_offset;
  }
}

  
  for(int i = 0; i <= strikes; i++){
    if(call_bid_points[i] > 0 || call_strike[i] == last_futures_handle){
    call_ask_ticks[i] = ((last_futures_ticks * 2) + 1);
    call_bid_ticks[i] = ((last_futures_ticks * 2));
    textFont (font , 14);
    fill(200);
    text(nf(call_ask_ticks[i] , 2),call_tick_placement,170);
    text(nf(call_bid_ticks[i] , 2),call_tick_placement,190);
    call_tick_placement += strike_offset;
    }
    else{
    call_ask_ticks[i] = ((last_futures_ticks * 2 + 1) - (i*(i/2)));
    call_bid_ticks[i] = ((last_futures_ticks * 2 ) - (i*(i/2)));
      if(call_ask_ticks[i] >= 1){
      fill(200);
      text(nf(call_ask_ticks[i], 2),call_tick_placement,170);
      }
      else{
        call_ask_ticks[i] = 1;
        text(nf(call_ask_ticks[i], 2),call_tick_placement,170);
        
      }
      if(call_bid_ticks[i] >= 1){
      fill(200);
      text(nf(call_bid_ticks[i], 2),call_tick_placement,190);
      call_tick_placement += strike_offset;
      }
       else{
    call_bid_ticks[i] = 0;
    text(nf(call_bid_ticks[i], 2),call_tick_placement,190);
    call_tick_placement += strike_offset;
    }
    }
  } 
   
  
  textFont (font , 14);
  fill(200);
  text("A:",5,170);
  
  textFont (font , 14);
  fill(200);
  text("B:",5,190);
  
  
  //Puts
  textFont (font , 32);
  fill(216,0,0);
  text("Puts",15,225);
  
  
  for(int i = 0; i <= strikes; i++){
  put_strike[i] = small_put_strike;
  small_put_strike += 1;
  }
  
 for(int i = 0; i <= strikes; i++){
  textFont (font , 16);
  fill(216,0,0);
  text(nf(put_strike[i],3),put_strike_placement,250);
  if(put_strike_placement < 700){
  put_strike_placement += strike_offset;
  }}
  
  
  for(int i = 0; i <= strikes; i++){
  if(put_strike[i] - last_futures_handle > 1){
  put_bid_points[i] = nf((put_strike[i] - last_futures_handle))-1;
  textFont (font , 14);
  fill(200);
  text(put_bid_points[i],put_bid_placement,270);
  text(put_bid_points[i],put_bid_placement,290);
  put_bid_placement += strike_offset;
  }
  else{
  textFont (font , 14);
  fill(200);
  text(0,put_bid_placement,270);
  text(0,put_bid_placement,290);
  put_bid_placement += strike_offset;
  }
}

 for(int i = 0; i <= strikes; i++){
    if(put_bid_points[i] > 0 || put_strike[i] == last_futures_handle + 1){
    put_ask_ticks[i] = ((64- (last_futures_ticks * 2)) + 1);
    put_bid_ticks[i] = ((64 -(last_futures_ticks * 2)));
    textFont (font , 14);
    fill(200);
    text(nf(put_ask_ticks[i] , 2),put_tick_placement,270);
    text(nf(put_bid_ticks[i] , 2),put_tick_placement,290);
    put_tick_placement += strike_offset;
    }
    else{
    put_ask_ticks[i] = ((64- (last_futures_ticks * 2)) + 1)-2*(12-i);
    put_bid_ticks[i] = (64- (last_futures_ticks * 2))-2*(12-i);
      if(put_ask_ticks[i] >= 1){
      fill(200);
      text(nf(put_ask_ticks[i], 2),put_tick_placement,270);
      }
      else{
        put_ask_ticks[i] = 1;
        text(nf(put_ask_ticks[i], 2),put_tick_placement,270);  
      }
      if(put_bid_ticks[i] >= 1){
      fill(200);
      text(nf(put_bid_ticks[i], 2),put_tick_placement,290);
      put_tick_placement += strike_offset;
      }
       else{
    put_bid_ticks[i] = 0;
    text(nf(put_bid_ticks[i], 2),put_tick_placement,290);
    put_tick_placement += strike_offset;
    }
    }
  } 
  
  textFont (font , 14);
  fill(200);
  text("A:",5,270);
  
  textFont (font , 14);
  fill(200);
  text("B:",5,290);
  
  //Straddles
  for(i = 1; i <= strikes - 2; i++){
    straddles[i] = 123 + i;
  }
  

//BEGIN INTERACTIVE SEQUENCE... FINALLY.
noStroke();
fill(122,138,142);
rect(0,300,1000,750);
image (questbackground,0,300);

//Command Line
stroke(0);
rect(50,450,200,150);
rect(275,450,200,150);
rect(500,450,200,150);

int[] strategy = new int[2];
strategy[0] = call_strike[call_i]; //call
strategy[1] = put_strike[put_i]; //put
strategy[2] = straddles[straddle_i];; //straddle
strategy_run = round(random(2));

int[] answer_posx = new int[2];
answer_posx[0] = 75;
answer_posx[1] = 300;
answer_posx[2] = 525;

answer_posy = 535;

textFont(font,52);
fill(255);
text(strategy[strategy_run], width/3, 350);
text("Which is the correct market?",50, 400);


if(strategy_run == 0){
  textFont(font,52);
  text("Call", width/2, 350);
  textFont(font,36);
  answer_bid_points = call_bid_points[call_i];
  answer_bid_ticks = call_bid_ticks[call_i];
  answer_ask_points = call_bid_points[call_i];
  answer_ask_ticks = call_ask_ticks[call_i];
  text(nf(answer_bid_points,1) + "." + nf(answer_bid_ticks,2),answer_posx[0],answer_posy);
  text(" / ", answer_posx[0]+60,answer_posy);
  text(nf(answer_ask_points,1) + "." + nf(answer_ask_ticks,2),answer_posx[0]+80,answer_posy);
 
  text(nf(call_bid_points[call_i-1],1) + "." + nf(answer_bid_ticks+1,2),answer_posx[1],answer_posy);
  text(" / ", answer_posx[1]+60,answer_posy);
  text(nf(call_bid_points[call_i-1],1) + "." + nf(answer_ask_ticks+1,2),answer_posx[1]+80,answer_posy);
  
  text(nf(call_bid_points[call_i+1],1) + "." + nf(answer_bid_ticks+1,2),answer_posx[2],answer_posy);
  text(" / ", answer_posx[2]+60,answer_posy);
  text(nf(call_bid_points[call_i+1],1) + "." + nf(answer_ask_ticks+1,2),answer_posx[2]+80,answer_posy);
}

  

if(strategy_run == 1){
  textFont(font,52);
  text("Put", width/2, 350);
  textFont(font,36);
  answer_bid_points = put_bid_points[put_i];
  answer_bid_ticks = put_bid_ticks[put_i];
  answer_ask_points = put_bid_points[put_i];
  answer_ask_ticks = put_ask_ticks[put_i];
  text(nf(answer_bid_points,1) + "." + nf(answer_bid_ticks,2),answer_posx[1],answer_posy);
  text(" / ", answer_posx[1]+60,answer_posy);
  text(nf(answer_ask_points,1) + "." + nf(answer_ask_ticks,2),answer_posx[1]+80,answer_posy);
  
  text(nf(answer_bid_points+1,1) + "." + nf(answer_bid_ticks+1,2),answer_posx[0],answer_posy);
  text(" / ", answer_posx[0]+60,answer_posy);
  text(nf(answer_ask_points+1,1) + "." + nf(answer_ask_ticks+1,2),answer_posx[0]+80,answer_posy);
  
  text(nf(answer_bid_points+2,1) + "." + nf(answer_bid_ticks,2),answer_posx[2],answer_posy);
  text(" / ", answer_posx[2]+60,answer_posy);
  text(nf(answer_ask_points+2,1) + "." + nf(answer_ask_ticks,2),answer_posx[2]+80,answer_posy);
  
}
if(strategy_run == 2){
  textFont(font,52);
  text("Straddle", width/2, 350);
  textFont(font,36);
  answer_bid_points = put_bid_points[straddle_i] + call_bid_points[straddle_i];
  answer_bid_ticks = put_bid_ticks[straddle_i] + call_bid_ticks[straddle_i];
  answer_ask_points = put_bid_points[straddle_i]+ call_bid_points[straddle_i];
  answer_ask_ticks = put_ask_ticks[straddle_i]+ call_ask_ticks[straddle_i];
  text(nf(answer_bid_points,1) + "." + nf(answer_bid_ticks,2),answer_posx[2],answer_posy);
  text(" / ", answer_posx[2]+60,answer_posy);
  text(nf(answer_ask_points,1) + "." + nf(answer_ask_ticks,2),answer_posx[2]+80,answer_posy);
   
  text(nf(put_bid_points[straddle_i+1] + call_bid_points[straddle_i+1],1) + "." + nf(answer_bid_ticks+1,2),answer_posx[0],answer_posy);
  text(" / ", answer_posx[0]+60,answer_posy);
  text(nf(put_bid_points[straddle_i+1]+ call_bid_points[straddle_i+1],1) + "." + nf(answer_ask_ticks,2),answer_posx[0]+80,answer_posy);
 
  text(nf(put_bid_points[straddle_i-1] + call_bid_points[straddle_i-1],1) + "." + nf(answer_bid_ticks+1,2),answer_posx[1],answer_posy);
  text(" / ", answer_posx[1]+60,answer_posy);
  text(nf(put_bid_points[straddle_i-1]+ call_bid_points[straddle_i-1],1) + "." + nf(answer_ask_ticks+1,2),answer_posx[1]+80,answer_posy);
  
}

if( win == 1 ){
  fill(4,175,16);
  rect(0,0,width,height);
  textFont(font,18);
  fill(255);
  text("Congratulations, your customer likes the market and tells you to buy 10,000.",50,height/3);
  text("You make roughly $3,000 and your customer will come back for more. ",50,height/2);
  text("Don't screw it up next time.",50,height-300);
}

if( win == 0 ){
  fill(247,0,0);
  rect(0,0,width,height);
  textFont(font,18);
  fill(255);
  text("Congratulations, you gave your customer a bad market and he traded it.",50,height/3);
  text("It costs you $15,000 to make the right trade, since you owe it to them. ",50,height/2);
  text("You may as well go home for the month, they aren't coming back anytime soon.",50,height-300);

}
    
}

void mousePressed() {
  if(strategy_run == 0){
  if (mouseX >= 50 && mouseX <= 200 && mouseY >= 450 && mouseY <= 600) {
    win = 1;
  }
   if (mouseX >= 275 && mouseX <= 475 && mouseY >= 450 && mouseY <= 600) {
    win = 0;
  }
  if (mouseX >= 500 && mouseX <= 700 && mouseY >= 450 && mouseY <= 600) {
    win = 0;
  }
  }
  if(strategy_run == 1){
    if (mouseX >= 275 && mouseX <= 475 && mouseY >= 450 && mouseY <= 600) {
    win = 1;
    }
   if (mouseX >= 50 && mouseX <= 200 && mouseY >= 450 && mouseY <= 600) {
    win = 0;
  }
  if (mouseX >= 500 && mouseX <= 700 && mouseY >= 450 && mouseY <= 600) {
    win = 0;
  }
  }
  if(strategy_run == 2){
  if (mouseX >= 500 && mouseX <= 700 && mouseY >= 450 && mouseY <= 600) {
    win = 1;
  }
  if (mouseX >= 50 && mouseX <= 200 && mouseY >= 450 && mouseY <= 600) {
    win = 0;
  }
  if (mouseX >= 275 && mouseX <= 475 && mouseY >= 450 && mouseY <= 600){
    win = 0;
  }
  }
  if(win == 1 || win == 0){
  draw();
  }

}


    


