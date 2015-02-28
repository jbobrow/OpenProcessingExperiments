
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(255,250,0);
  text("Hello World",20,20);


//define array of purchases objects  
  var purchases = [
  {
  pquantity: 5,
  pcostperunit: 1
  },
  {
  pquantity: 10,
  pcostperunit: 100
  },
  {
  pquantity: 100,
  pcostperunit: 1000
  }
  ] ;
  
  var sales = [
  {
  squantity: 15
  
  },
  {
  squantity: 10
  },
  {
  squantity: 20
  }
  ] ;
  
  //define lifo looping of sales and purchases
  for(var i = 0; i < sales.length;i++){
  text(sales[i].squantity,30,40+i*20);
  }

}
