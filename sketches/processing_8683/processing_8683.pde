

String IP;

import java.net.InetAddress;
InetAddress inet;

void setup() {
  size(398,394);
  smooth();
  noStroke();
  
  try {
  inet = InetAddress.getLocalHost();
  println(inet);
  } 
  catch (Exception e) {
  e.printStackTrace();
  }
  String[] parse = split(inet.toString(), '/'); 
  int[] nums = int(split(parse[1], '.'));
  
  background(0);
  pushMatrix(); 
  translate((width/24)/2,0); // center the image left to right
  //permutate through the possible color/height combinations
  //123
  fill(nums[0],nums[1],nums[2]);
  rect(0*(width/24),(height-nums[3])/2,width/24,nums[3]);
  //124
  fill(nums[1],nums[2],nums[3]);
  rect(1*(width/24),(height-nums[0])/2,width/24,nums[0]);
  //132
  fill(nums[0],nums[2],nums[1]);
  rect(2*(width/24),(height-nums[3])/2,width/24,nums[3]);
  //134
  fill(nums[0],nums[2],nums[3]);
  rect(3*(width/24),(height-nums[1])/2,width/24,nums[1]);
  //124
  fill(nums[0],nums[1],nums[3]);
  rect(4*(width/24),(height-nums[2])/2,width/24,nums[2]);
  //143
  fill(nums[0],nums[3],nums[2]);
  rect(5*(width/24),(height-nums[1])/2,width/24,nums[1]);
  //213
  fill(nums[1],nums[0],nums[2]);
  rect(6*(width/24),(height-nums[3])/2,width/24,nums[3]);
  //214
  fill(nums[1],nums[0],nums[3]);
  rect(7*(width/24),(height-nums[2])/2,width/24,nums[2]);
  //231
  fill(nums[1],nums[2],nums[0]);
  rect(8*(width/24),(height-nums[3])/2,width/24,nums[3]);
  //234
  fill(nums[1],nums[2],nums[3]);
  rect(9*(width/24),(height-nums[0])/2,width/24,nums[0]);
  //241
  fill(nums[1],nums[3],nums[0]);
  rect(10*(width/24),(height-nums[2])/2,width/24,nums[2]);
  //243
  fill(nums[1],nums[3],nums[2]);
  rect(11*(width/24),(height-nums[0])/2,width/24,nums[0]);
  //312
  fill(nums[2],nums[0],nums[1]);
  rect(12*(width/24),(height-nums[3])/2,width/24,nums[3]);
  //314
  fill(nums[2],nums[0],nums[3]);
  rect(13*(width/24),(height-nums[1])/2,width/24,nums[1]);
  //321
  fill(nums[2],nums[3],nums[2]);
  rect(14*(width/24),(height-nums[1])/2,width/24,nums[1]);
  //324
  fill(nums[2],nums[1],nums[3]);
  rect(15*(width/24),(height-nums[0])/2,width/24,nums[0]);
  //341
  fill(nums[2],nums[3],nums[0]);
  rect(16*(width/24),(height-nums[1])/2,width/24,nums[1]);
  //342
  fill(nums[2],nums[3],nums[1]);
  rect(17*(width/24),(height-nums[0])/2,width/24,nums[0]);
  //412
  fill(nums[3],nums[0],nums[1]);
  rect(18*(width/24),(height-nums[2])/2,width/24,nums[2]);
  //413
  fill(nums[3],nums[0],nums[2]);
  rect(19*(width/24),(height-nums[1])/2,width/24,nums[1]);  
  //421
  fill(nums[3],nums[1],nums[0]);
  rect(20*(width/24),(height-nums[2])/2,width/24,nums[2]);
  //423
  fill(nums[3],nums[1],nums[2]);
  rect(21*(width/24),(height-nums[0])/2,width/24,nums[0]);
  //431
  fill(nums[3],nums[2],nums[0]);
  rect(22*(width/24),(height-nums[1])/2,width/24,nums[1]);  
  //432
  fill(nums[3],nums[2],nums[1]);
  rect(23*(width/24),(height-nums[0])/2,width/24,nums[0]);
  popMatrix();
}



