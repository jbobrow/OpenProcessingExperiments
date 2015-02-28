
Spider mySpider;
  Spider2 mySpider2;

    void setup() {
    size(640,480);
    smooth();
    frameRate(30);
    
    mySpider = new Spider();
    mySpider2= new Spider2();
    }
    
    void draw() {
    background(255);
    
    //function calls
    mySpider.moveSpider();
    mySpider.drawSpider();

    //function calls
    mySpider2.moveSpider2();
    mySpider2.drawSpider2();
   }

