

import org.gicentre.utils.stat.*;

import de.looksgood.ani.*;
import controlP5.*;
import guicomponents.*;

import proxml.*;

int windowHoogte = 800;
int windowBreedte = windowHoogte+300;
int margeLinks = 10;
int margeBoven = margeLinks;

int xStart = 500;
int yStart = 200;
int strategie = 10;
int productIndex = 0;

int teller =0;

ControlP5 controlGUI;
ControlP5 controlCHART;
PImage bcgLeeg;
Textarea analysisText;
Textarea analysisLabel;
Knob k1;
Knob k2;
Knob k3;
Knob k4;
Knob k5;
Knob k6;
Knob k7;
Knob k8;
Knob k9;
Knob k10;
Textfield naam;
Chart myChart;
Product[] product = {new Product(color(234,214,101),"KROONKURKEN"),
                   new Product(color(177,232,105),"RINGDOPPEN"),
                   new Product(color(235,240,126),"WAXINELICHTCUPJES"),
                   new Product(color(105,232,222),"SCHROEFDOPPEN"),
                   new Product(color(105,169,232),"BEDRUKKINGEN")                   
                  };
private GWindow chartWindow;                  

XMLElement products;
XMLInOut xmlInOut = new XMLInOut(this);;

void setup() {
   size((int)windowBreedte, (int)windowHoogte);
   background(#FFFEF0);
   smooth();
   bcgLeeg = loadImage("BCG_matrix_vaag.png");
   stroke(206,202,202);
   strokeWeight(4);
   line(0,563,windowBreedte,563);
   line((windowBreedte/2)+50,0,(windowBreedte/2)+50,563);
   fill(#F7F098);   
   
   Ani.init(this);        
   xmlInOut = new XMLInOut(this);
   drawGUI(); 
   naam.setText("Vul hier je volledige naam in");
   createChartWindow();   
}

void draw() {
  image(bcgLeeg, margeLinks,margeBoven,windowBreedte/2,windowBreedte/2);
 
  for (int i=0; i<product.length;i++){
    product[i].draw();
  }
  stroke(0); 
  analysisLabel.setText("\nSTART DE ANALYSE VOOR \n"+product[productIndex].getLabel());
}


public void drawGUI() {
   controlGUI = new ControlP5(this);   
   
   controlGUI.setFont(createFont("Calibri",12));
   Group portfolio = controlGUI.addGroup("portfolio")
                                .setPosition(windowBreedte/2+100,margeBoven+30)
                                .setWidth(430)
                                .activateEvent(true)
                                .setBackgroundColor(color(206,202,202))
                                .setBackgroundHeight(250)
                                .setBarHeight(15)
                                ;               
                                 
                       controlGUI.addRadioButton("products")
                             .setPosition(10,10)
                             .setSize(20,20)   
                             .setColorLabel(0) 
                             .setItemsPerRow(2)
                             .setSpacingColumn(150)                             
                             .addItem("Kroonkurken",0)
                             .addItem("Ringdoppen",1)
                             .addItem("Waxinelichtcupjes",2)
                             .addItem("Schroefdoppen",3)
                             .addItem("Bedrukkingen",4)
                             .activate(0)
                             .setGroup(portfolio)
                             ;
                                                                                                                                               
                       controlGUI.addSlider("marktaandeel")
                                 .setGroup(portfolio)
                                 .setPosition(10,90)
                                 .setWidth(250)
                                 .setRange(0,100)
                                 .setValue(20)
                                 .setColorCaptionLabel(0)
                                 .setColorTickMark(0)
                                 .setColorActive(color(200,200,200))
                                 .setColorForeground(color(155,155,155))
                                 .setNumberOfTickMarks(21)
                                 .setSliderMode(Slider.FLEXIBLE)
                                 .setTriggerEvent(Slider.RELEASE)
                                 .setHeight(15) 
                                 ;
                       controlGUI.addSlider("marktgroei")
                                 .setGroup(portfolio)
                                 .setPosition(10,120)
                                 .setWidth(250)
                                 .setRange(0,100)
                                 .setValue(20)
                                 .setColorCaptionLabel(0)
                                 .setColorTickMark(0)
                                 .setColorActive(color(200,200,200))
                                 .setColorForeground(color(155,155,155))
                                 .setNumberOfTickMarks(21)
                                 .setSliderMode(Slider.FLEXIBLE)
                                 .setTriggerEvent(Slider.RELEASE)
                                 .setHeight(15) 
                                 ;             
                       
                       controlGUI.addKnob("marktwaarde")
                                 .setGroup(portfolio)
                                 .setPosition(150,150)
                                 .setRadius(40)
                                 .setColorCaptionLabel(0)
                                 .setColorForeground(color(155,155,155))
                                 .setResolution(50.0)
                                 .setNumberOfTickMarks(20)
                                 .setTickMarkLength(4)                                 
                                 .snapToTickMarks(true)                                              
                                 .setColorActive(color(200,200,200))
                                 .setDragDirection(Knob.HORIZONTAL)
                                 .setViewStyle(Knob.ARC)             
                                 ;
   
   Group strategie = controlGUI.addGroup("strategie")
                               .setPosition(windowBreedte/2+100,305)
                               .setWidth(430)
                               .activateEvent(true)
                               .setBackgroundColor(color(206,202,202))
                               .setBackgroundHeight(220)
                               .setBarHeight(15)
                               ;
   
                   controlGUI.addRadioButton("radioButtons")
                             .setPosition(10,10)
                             .setSize(50,50)   
                             .setColorLabel(0)                                     
                             .addItem("Build Market Share: Invest in product",0)
                             .addItem("Hold: Maintain the status quo",1)
                             .addItem("Divest: get rid of product",2)
                             .addItem("Harvest: reduce investments",3)
                             .setGroup("strategie")
                             ;

         Group plc = controlGUI.addGroup("analysis")
                               .setPosition(margeLinks,585)
                               .setWidth(windowBreedte - 30)
                               .activateEvent(true)
                               .setBackgroundColor(color(206,202,202))
                               .setBackgroundHeight(215)
                               .setBarHeight(15)
                               ;                                                                                                 
                                  
                  k1 = controlGUI.addKnob("marketsize")
                                 .setGroup("analysis")                                 
                                 .setPosition(20,20)
                                 .setRadius(20)
                                 .setResolution(50.0)
                                 .setRange(0.0,5.0)                        
                                 .setColorCaptionLabel(0)                                 
                                 .setNumberOfTickMarks(5)
                                 .setTickMarkLength(2)
                                 .snapToTickMarks(true)  
                                 .setColorForeground(color(155,155,155))                                 
                                 .setColorActive(color(200,200,200))
                                 .setDragDirection(Knob.HORIZONTAL)
                                 .setViewStyle(Knob.ARC)             
                                 ;                                 
                   
                  k2 = controlGUI.addKnob("marketgrowth")
                                 .setGroup("analysis")                                 
                                 .setPosition(120,20)
                                 .setRadius(20)
                                 .setResolution(50.0)
                                 .setRange(0.0,5.0)
                                 .setColorCaptionLabel(0)
                                 .setColorForeground(0)
                                 .setNumberOfTickMarks(5)
                                 .setTickMarkLength(2)
                                 .snapToTickMarks(true)             
                                 .setColorForeground(color(155,155,155))                                 
                                 .setColorActive(color(200,200,200))
                                 .setDragDirection(Knob.HORIZONTAL)
                                 .setViewStyle(Knob.ARC)             
                                 ;  
                                 
                       
                  k3 = controlGUI.addKnob("profitability")
                                 .setGroup("analysis")                                 
                                 .setPosition(220,20)
                                 .setRadius(20)
                                 .setResolution(50.0)     
                                 .setRange(0.0,5.0)
                                 .setColorCaptionLabel(0)
                                 .setColorForeground(0)
                                 .setNumberOfTickMarks(5)
                                 .setTickMarkLength(2)
                                 .snapToTickMarks(true)             
                                 .setColorForeground(color(155,155,155))                                 
                                 .setColorActive(color(200,200,200))
                                 .setDragDirection(Knob.HORIZONTAL)
                                 .setViewStyle(Knob.ARC)             
                                 ;         
                            
                  k4 = controlGUI.addKnob("competition")
                                 .setGroup("analysis")                                 
                                 .setPosition(320,20)
                                 .setRadius(20)
                                 .setResolution(50.0)                                 
                                 .setRange(0.0,5.0)
                                 .setColorCaptionLabel(0)
                                 .setColorForeground(0)
                                 .setNumberOfTickMarks(5)
                                 .setTickMarkLength(2)
                                 .snapToTickMarks(true)             
                                 .setColorForeground(color(155,155,155))                                 
                                 .setColorActive(color(200,200,200))
                                 .setDragDirection(Knob.HORIZONTAL)
                                 .setViewStyle(Knob.ARC)             
                                 ;
                                 
                  k5 = controlGUI.addKnob("customerpower")
                                 .setGroup("analysis")                                 
                                 .setPosition(420,20)
                                 .setRadius(20)
                                 .setResolution(50)                                 
                                 .setRange(0,5)
                                 .setColorCaptionLabel(0)
                                 .setColorForeground(0)
                                 .setNumberOfTickMarks(5)
                                 .setTickMarkLength(2)
                                 .snapToTickMarks(true)             
                                 .setColorForeground(color(155,155,155))                                 
                                 .setColorActive(color(200,200,200))
                                 .setDragDirection(Knob.HORIZONTAL)
                                 .setViewStyle(Knob.ARC)             
                                 ;
                   
                  k6 = controlGUI.addKnob("marketshare")
                                 .setGroup("analysis")                                 
                                 .setPosition(20,85)
                                 .setRadius(20)      
                                 .setResolution(50.0)                           
                                 .setRange(0.0,5.0)
                                 .setColorCaptionLabel(0)
                                 .setColorForeground(0)
                                 .setNumberOfTickMarks(5)
                                 .setTickMarkLength(2)
                                 .snapToTickMarks(true)             
                                 .setColorForeground(color(155,155,155))                                 
                                 .setColorActive(color(200,200,200))
                                 .setDragDirection(Knob.HORIZONTAL)
                                 .setViewStyle(Knob.ARC)             
                                 ;
                   
                   k7 =controlGUI.addKnob("productquality")
                                 .setGroup("analysis")                                 
                                 .setPosition(120,85)
                                 .setRadius(20)
                                 .setResolution(50.0)
                                 .setRange(0.0,5.0)
                                 .setColorCaptionLabel(0)
                                 .setColorForeground(0)
                                 .setNumberOfTickMarks(5)
                                 .setTickMarkLength(2)
                                 .snapToTickMarks(true)             
                                 .setColorForeground(color(155,155,155))                                 
                                 .setColorActive(color(200,200,200))
                                 .setDragDirection(Knob.HORIZONTAL)
                                 .setViewStyle(Knob.ARC)             
                                 ;        
                       
                   k8 = controlGUI.addKnob("reputation")
                                 .setGroup("analysis")                                 
                                 .setPosition(220,85)
                                 .setRadius(20)
                                 .setResolution(50.0)                                 
                                 .setRange(0.0,5.0)
                                 .setColorCaptionLabel(0)
                                 .setColorForeground(0)
                                 .setNumberOfTickMarks(5)
                                 .setTickMarkLength(2)
                                 .snapToTickMarks(true)             
                                 .setColorForeground(color(155,155,155))                                 
                                 .setColorActive(color(200,200,200))
                                 .setDragDirection(Knob.HORIZONTAL)
                                 .setViewStyle(Knob.ARC)             
                                 ;         
                            
                  k9 = controlGUI.addKnob("price")
                                 .setGroup("analysis")                                 
                                 .setPosition(320,85)
                                 .setRadius(20)
                                 .setResolution(50.0)                                 
                                 .setRange(0.0,5.0)
                                 .setColorCaptionLabel(0)
                                 .setColorForeground(0)
                                 .setNumberOfTickMarks(5)
                                 .setTickMarkLength(2)
                                 .snapToTickMarks(true)             
                                 .setColorForeground(color(155,155,155))                                 
                                 .setColorActive(color(200,200,200))
                                 .setDragDirection(Knob.HORIZONTAL)
                                 .setViewStyle(Knob.ARC)             
                                 ;              
                          
                 k10 = controlGUI.addKnob("presence")
                                 .setGroup("analysis")                                 
                                 .setPosition(420,85)
                                 .setRadius(20)
                                 .setResolution(50.0)
                                 //.setDecimalPrecision(0)
                                 .setRange(0.0,5.0)
                                 .setColorCaptionLabel(0)
                                 .setColorForeground(0)
                                 .setNumberOfTickMarks(5)
                                 .setTickMarkLength(2)
                                 .snapToTickMarks(true)             
                                 .setColorForeground(color(155,155,155))                                 
                                 .setColorActive(color(200,200,200))
                                 .setDragDirection(Knob.HORIZONTAL)
                                 .setViewStyle(Knob.ARC)             
                                 ;                     


                         analysisText = controlGUI.addTextarea("txt")
                                  .setGroup("analysis")
                                  .setPosition(635,20)
                                  .setSize(400,130)                                  
                                  .setLineHeight(14)
                                  .setColorBackground(color(180,180,180))
                                  .setColor(color(0))  
                                  .setFont(createFont("Calibri",20))                                  
                                  ;
                                  
                         analysisLabel = controlGUI.addTextarea("analysislabel")                              
                              .setPosition(400,160)   
                              .setSize(190,50)                           
                              .setColor(255)
                              .setColorBackground(color(24,65,95))                             
                              .setGroup("analysis")                              
                              ;    
                   
                     PImage[] icons = {loadImage("button_a.png"),loadImage("button_b.png"),loadImage("button_c.png")};             
                     controlGUI.addButton("analysis_start")
                               .activateBy(2)
                               .setValue(128)             
                               .setPosition(550,160)                               
                               .setImages(icons)
                               .updateSize()
                               .setGroup("analysis")             
                               ;
              naam = controlGUI.addTextfield("")
                               .setPosition(150,160)
                               .setGroup("analysis")
                               .setColorBackground(color(24,65,95))
                               .setSize(165,25)                               
                               ;
                     controlGUI.addButton("loadXML")
                               .setLabel("Laad resultaten uit\n XML bestand")
                               .setPosition(width-400,height-55)
                               .setColorBackground(color(24,65,95))
                               .setSize(165,55)
                               ;
                               
                     controlGUI.addButton("saveXML")
                               .setLabel("Sla resultaten op in\n XML bestand")
                               .setPosition(width-200,height-55)
                               .setColorBackground(color(24,65,95))
                               .setSize(145,55)
                               ;
          
   controlGUI.getTooltip().setDelay(300);   
   controlGUI.getTooltip().register("businessvalue","Determines the business value of the product");   
   controlGUI.getTooltip().register("market growth","Determines the actual or expected marketgrowth of the product");
   controlGUI.getTooltip().register("market share","Determines the actual marketshare of the product");
   
}             
class Product {
  
  float x;
  float y;
  String label;
  color c ;
  float diameter = 20;
  float xBang = 0.0;
  float yBang = 0.0;      
  
  float marktOmvang = 0.0;
  float marktGroei = 0.0;
  float winstGevendheid = 0.0;
  float concurrentie = 0.0;
  float klantMacht = 0.0;

  float marktAandeel = 0.0;
  float productKwaliteit = 0.0;
  float reputatie = 0.0;
  float prijs = 0.0;
  float geo = 0.0;
  
  String strategie="START";
  
  final float WEGING = 0.25;
  
  Product(color c, String label) {            
    this.c = c;
    this.label = label;
  }
  
  void bang(float value, String axis) {
    
    if (axis.equals("x")){
      xBang = map(value, 0, 100, 50+getRadius(), 550-70);
     
    }
    if (axis.equals("y")){
      yBang = map(value, 0, 100, 30+getRadius(), 520-90);
     
    }
    
    Ani.to(this, 1.5, "x", xBang, Ani.EXPO_IN_OUT);
    Ani.to(this, 1.5, "y", 520-yBang, Ani.EXPO_IN_OUT);
    
  }

  void draw() {
    if (x>50+product[productIndex].getRadius() && x<550-product[productIndex].getRadius() && y>30+product[productIndex].getRadius() && y<520-product[productIndex].getRadius()){    
      noStroke();        
      fill(0);
      text(label,x-(textWidth(label))/2,y-getRadius());
      fill(c);
      ellipse(x, y, diameter, diameter);
    }      
  }
  
  float getX() {
    return x;
  }
  
  float getY() {
    return y;
  }
  
  float getDiameter() {
    return diameter;
  }
  float getRadius() {
    return diameter/2;
  }
  
  void setDiameter(float diameter){
    this.diameter = diameter;
  }
  
  void setX(float x) {
    this.x = x;
  }
  
  void setY(float y) {
    this.y = y;
  }
  
  color getColor() {
    return c;
  }
  
  void setColor(color c) {
    this.c = c;
  }
  
  String getLabel() {
    return label;
  }
  
  void setLabel(String label) {
    this.label = label;
  }
  
  float getMarktOmvang() {
    return marktOmvang;
  }
  
  void setMarktOmvang(float marktOmvang) {
    this.marktOmvang = marktOmvang;
  }
  
  float getMarktGroei() {
    return marktGroei;
  }
  
  void setMarktGroei(float marktGroei) {
    this.marktGroei = marktGroei;
  }
  
  float getWinstGevendheid() {
    return winstGevendheid;
  }
  
  void setWinstGevendheid(float winstGevendheid) {
    this.winstGevendheid = winstGevendheid; 
  }
  
  float getConcurrentie() {
    return concurrentie;
  }
  
  void setConcurrentie(float concurrentie) {
    this.concurrentie = concurrentie;
  }
  
  float getKlantMacht() {
    return klantMacht;
  }
  
  void setKlantMacht(float klantMacht) {
    this.klantMacht = klantMacht;
  }

  float getMarktAandeel() {
    return marktAandeel;
  }
  
  void setMarktAandeel(float marktAandeel) {
    this.marktAandeel = marktAandeel;
  }
  
  float getProductKwaliteit() {
    return productKwaliteit;
  }
  
  void setProductKwaliteit(float productKwaliteit) {
    this.productKwaliteit = productKwaliteit;
  }
  
  float getReputatie() {
    return reputatie;
  }
  
  void setReputatie(float reputatie) {
    this.reputatie = reputatie;
  }
  
  float getPrijs() {
    return prijs;
  }
  
  void setPrijs(float prijs) {
    this.prijs = prijs;
  }
  
  float getGeo() {
    return geo;
  }
  
  void setGeo(float geo) {
    this.geo = geo;
  }
  
  float getMarktAantrekkelijkheid() {
    float marktAantrekkelijkheid = (marktOmvang*WEGING)+(marktGroei*WEGING)+(winstGevendheid*WEGING)+(concurrentie*WEGING)+(klantMacht*WEGING);
    return marktAantrekkelijkheid;
  }
  
  float getMarktPositie() {
      float marktPositie = (marktAandeel*WEGING)+(productKwaliteit*WEGING)+(reputatie*WEGING)+(prijs*WEGING)+(geo*WEGING);     
      return marktPositie;
  }
  
  void setStrategie(String strategie) {
    this.strategie = strategie;
  }
  
  String getStrategie() {
    return strategie;
  }
  
}  


void xmlEvent(XMLElement element){
  products = element;
  initXMLLoad(product);   
} 

void loadXMLFile(){  
  try {
  xmlInOut.loadElement("bcg.xml");
  }
  catch (Exception e) {
    xmlEvent(new XMLElement("bcg"));
  }     
}

void initXMLLoad(Product[] bcgproducts) {
  XMLElement author;
  XMLElement authorDetails;
  XMLElement product;
  XMLElement details;
  XMLElement aantrek;
  XMLElement positie;
  
  for (int i = 0; i<products.countChildren(); i++) {                  
      if (i < 1) {
        author = products.getChild(i);
        authorDetails = author.getChild(0);
        naam.setText(authorDetails.getAttribute("Naam"));        
      } else {      
        product = products.getChild(i);
        details = product.getChild(0);
        aantrek = product.getChild(1);
        positie = product.getChild(2);
        
        bcgproducts[i-1].setColor(details.getIntAttribute("color"));
        bcgproducts[i-1].setLabel(details.getAttribute("label"));
        bcgproducts[i-1].setDiameter(details.getFloatAttribute("diameter"));
        bcgproducts[i-1].setX(details.getFloatAttribute("xPos"));
        bcgproducts[i-1].setY(details.getFloatAttribute("yPos"));
        
        bcgproducts[i-1].setMarktGroei(aantrek.getFloatAttribute("marktGroei"));
        bcgproducts[i-1].setConcurrentie(aantrek.getFloatAttribute("concurrentie"));
        bcgproducts[i-1].setWinstGevendheid(aantrek.getFloatAttribute("winstGevendheid"));
        bcgproducts[i-1].setMarktOmvang(aantrek.getFloatAttribute("marktOmvang"));
        bcgproducts[i-1].setKlantMacht(aantrek.getFloatAttribute("klantMacht"));
        
        bcgproducts[i-1].setReputatie(positie.getFloatAttribute("reputatie"));
        bcgproducts[i-1].setProductKwaliteit(positie.getFloatAttribute("productKwaliteit"));
        bcgproducts[i-1].setPrijs(positie.getFloatAttribute("prijs"));
        bcgproducts[i-1].setMarktAandeel(positie.getFloatAttribute("marktAandeel"));
        bcgproducts[i-1].setGeo(positie.getFloatAttribute("geo"));
        
        k1.setValue(bcgproducts[i-1].getMarktOmvang());
        k2.setValue(bcgproducts[i-1].getMarktGroei()); 
        k3.setValue(bcgproducts[i-1].getWinstGevendheid());
        k4.setValue(bcgproducts[i-1].getConcurrentie());
        k5.setValue(bcgproducts[i-1].getKlantMacht());
        k6.setValue(bcgproducts[i-1].getMarktAandeel());
        k7.setValue(bcgproducts[i-1].getProductKwaliteit());
        k8.setValue(bcgproducts[i-1].getReputatie());
        k9.setValue(bcgproducts[i-1].getPrijs());
        k10.setValue(bcgproducts[i-1].getGeo());
        analysisText.setText(buildAnalysis(bcgproducts[i-1].getStrategie()));
     }
  }      
}

void saveXMLFile(){
  
  xmlInOut = new XMLInOut(this);
  xmlEvent(new XMLElement("products"));
  try {
    saveProducts(product);       
  }
  catch (Exception e) {
    println("File is not saved due to errors"+e.toString());
  }
}

void saveProducts(Product[] producten) {      
  
    XMLElement author = new XMLElement("author");    
    products.addChild(author);    
    XMLElement detailsAuth = new XMLElement("detailsAuth");
    detailsAuth.addAttribute("Naam",naam.getText());
    detailsAuth.addAttribute("Klas","I1C-N");
    detailsAuth.addAttribute("Datumtijd",day()+"-"+month()+"-"+year()+"  "+hour()+":"+minute());
    author.addChild(detailsAuth);
    
    for (int i = 0; i<producten.length; i++) {      
      XMLElement product = new XMLElement("product");
      products.addChild(product);
      XMLElement details = new XMLElement("details");
      details.addAttribute("color",producten[i].getColor());
      details.addAttribute("label",producten[i].getLabel());
      details.addAttribute("xPos",producten[i].getX());
      details.addAttribute("yPos",producten[i].getY());
      details.addAttribute("diameter",producten[i].getDiameter());
      product.addChild(details);
      XMLElement aantrek = new XMLElement("marktAantrekkelijkheid");
      aantrek.addAttribute("marktOmvang",producten[i].getMarktOmvang());
      aantrek.addAttribute("marktGroei",producten[i].getMarktGroei());
      aantrek.addAttribute("winstGevendheid",producten[i].getWinstGevendheid());
      aantrek.addAttribute("concurrentie",producten[i].getConcurrentie());
      aantrek.addAttribute("klantMacht",producten[i].getKlantMacht());
      product.addChild(aantrek);
      
      XMLElement positie = new XMLElement("marktPositie");
      positie.addAttribute("marktAandeel",producten[i].getMarktAandeel());
      positie.addAttribute("productKwaliteit",producten[i].getProductKwaliteit());
      positie.addAttribute("reputatie",producten[i].getReputatie());
      positie.addAttribute("prijs",producten[i].getPrijs());
      positie.addAttribute("geo",producten[i].getGeo());
      product.addChild(positie);
    }
    
    xmlInOut.saveElement(products,"bcg.xml");
    println("File bcg.xml saved!");
}
public String buildAnalysis(String key) {
  HashMap analysisText = new HashMap();
  
  analysisText.put("START","The result of the analysis will be displayed here.");
  
  analysisText.put("H/L","High market-attractiveness, weak market-position and competitive power. Selective investments. Look for opportunities to invest.");
  analysisText.put("H/M","High market-attractiveness, average market-position and competitive power. Invest to grow. Try to increase marketshare.");
  analysisText.put("H/H","High market-attractiveness, high market-position and competitive power. Invest to protect position.");
  
  analysisText.put("M/L","Medium market-attractiveness, weak market-position and competitive power. Either harvest or choose for little expansion without risk.");
  analysisText.put("M/M","Medium market-attractiveness, average market-position and competitive power. Selective investments in profitable marketsegments.");
  analysisText.put("M/H","Medium market-attractiveness, high market-position and competitive power. Selective investments to maintain position, market is becoming less attractive.");
  
  analysisText.put("L/L","Low market-attractiveness, weak market-position and competitive power. Divest, move investments to other products.");
  analysisText.put("L/M","Low market-attractiveness, average market-position and competitive power. Harvest profits, no investments.");
  analysisText.put("L/H","Low market-attractiveness, high market-position and competitive power. Harvest profits, protect position, little or no investments.");
  
  return (String)analysisText.get(key);
  
}
public void createChartWindow() {
  chartWindow = new GWindow(this, "Chartwindow",50,130,600,450, false, JAVA2D);
  chartWindow.setBackground(200);
  chartWindow.addDrawHandler(this,"windowDraw");
  chartWindow.setOnTop(false);
  chartWindow.setResizable(false);
  
}

public void windowDraw(GWinApplet app, GWinData data) {

  BarChart barChart1 = new BarChart(app);
  app.textFont(loadFont("CordiaNew-16.vlw"));
  barChart1.setData(new float[] {product[0].getMarktAantrekkelijkheid(),
                                product[1].getMarktAantrekkelijkheid(),
                                product[2].getMarktAantrekkelijkheid(),
                                product[3].getMarktAantrekkelijkheid(),
                                product[4].getMarktAantrekkelijkheid(),  
                                });
  barChart1.setBarLabels(new String[] {product[0].getLabel(),
                                      product[1].getLabel(),
                                      product[2].getLabel(),
                                      product[3].getLabel(),
                                      product[4].getLabel(),
                                      });
  barChart1.setBarColour(color(24,65,95));
  barChart1.setBarGap(1); 
  barChart1.setValueFormat("#,#");
  barChart1.showValueAxis(true); 
  barChart1.showCategoryAxis(true); 
  barChart1.setMaxValue(7); 
  barChart1.draw(15,5,app.width-20,200);
  app.fill(120);
  app.text("Market Attractiveness",50,15);

  BarChart barChart2 = new BarChart(app);
  app.textFont(loadFont("CordiaNew-16.vlw"));
  barChart2.setData(new float[] {product[0].getMarktPositie(),
                                 product[1].getMarktPositie(),
                                 product[2].getMarktPositie(),
                                 product[3].getMarktPositie(),
                                 product[4].getMarktPositie(),  
                                 });
  barChart2.setBarLabels(new String[] {product[0].getLabel(),
                                      product[1].getLabel(),
                                      product[2].getLabel(),
                                      product[3].getLabel(),
                                      product[4].getLabel(),
                                      });
  barChart2.setBarColour(color(94,135,165));
  barChart2.setBarGap(1); 
  barChart2.setValueFormat("#,#");
  barChart2.showValueAxis(true); 
  barChart2.showCategoryAxis(true); 
  barChart2.setMaxValue(7); 
  barChart2.draw(15,250,app.width-20,200);
  app.fill(120);
  app.text("Market Position",50,255);   
  
}

public void marktaandeel(int theValue) {
  //Evolves on the x-axis 50-550
  product[productIndex].bang(theValue, "x");
}

public void marktgroei(int theValue) {
  //Evolves on the y-axis 30-520
  product[productIndex].bang(theValue, "y");
}

public void marktwaarde(int theValue) {
  product[productIndex].setDiameter(theValue);
}

public void products(int theValue) {
  productIndex = theValue;
  k1.setValue(product[productIndex].getMarktOmvang());
  k2.setValue(product[productIndex].getMarktGroei()); 
  k3.setValue(product[productIndex].getWinstGevendheid());
  k4.setValue(product[productIndex].getConcurrentie());
  k5.setValue(product[productIndex].getKlantMacht());
  k6.setValue(product[productIndex].getMarktAandeel());
  k7.setValue(product[productIndex].getProductKwaliteit());
  k8.setValue(product[productIndex].getReputatie());
  k9.setValue(product[productIndex].getPrijs());
  k10.setValue(product[productIndex].getGeo());
  analysisText.setText(buildAnalysis(product[productIndex].getStrategie()));
}

public void radioButtons(int theValue) {  
  switch(theValue) {
  case 0: 
    product[productIndex].bang(25, "x");
    product[productIndex].bang(85
      , "y");
    break;
  case 1:
    product[productIndex].bang(85, "x");
    product[productIndex].bang(85, "y");
    break;
  case 2:
    product[productIndex].bang(25, "x");
    product[productIndex].bang(20, "y");
    break;
  case 3:
    product[productIndex].bang(85, "x");
    product[productIndex].bang(20, "y");
    break;
  }
}

public void marketsize(int theValue) {
  product[productIndex].setMarktOmvang(theValue);
}

public void marketgrowth(int theValue) {
  product[productIndex].setMarktGroei(theValue);
}

public void profitability(int theValue) {
  product[productIndex].setWinstGevendheid(theValue);
}

public void competition(int theValue) {
  product[productIndex].setConcurrentie(theValue);
}

public void customerpower(int theValue) {
  product[productIndex].setKlantMacht(theValue);
}

public void marketshare(int theValue) {
  product[productIndex].setMarktAandeel(theValue);
}

public void productquality(int theValue) {
  product[productIndex].setProductKwaliteit(theValue);
}

public void reputation(int theValue) {
  product[productIndex].setReputatie(theValue);
}

public void price(int theValue) {
  product[productIndex].setPrijs(theValue);
}

public void presence(int theValue) {
  product[productIndex].setGeo(theValue);
}


public void analysis_start(int theValue) {   
  float marktAantrekkelijkheid = product[productIndex].getMarktAantrekkelijkheid();
  float marktPositie = product[productIndex].getMarktPositie();     
  product[productIndex].setStrategie(bepaalStrategie(marktAantrekkelijkheid, marktPositie));  
} 

public String bepaalStrategie(float aantrek, float positie) {
  String strategie = "START";
  analysisText.setText(buildAnalysis(strategie));
  product[productIndex].setDiameter(constrain((aantrek*positie)*3, 20, 100));
  
    if (aantrek >3.3 && positie<1.67) {
    strategie="H/L";
    product[productIndex].bang(25, "x");
    product[productIndex].bang(80, "y");
    analysisText.setText(product[productIndex].getLabel()+": "+buildAnalysis(strategie));
  } 

  if (aantrek > 3.33 && positie > 1.67 && positie < 3.33) {
    strategie="H/M";
    product[productIndex].bang(56, "x");
    product[productIndex].bang(80, "y");
    analysisText.setText(product[productIndex].getLabel()+": "+buildAnalysis(strategie));
  } 

  if (aantrek >3.33 && positie>3.33) {
    strategie = "H/H";    
    product[productIndex].bang(85, "x");
    product[productIndex].bang(80, "y");
    analysisText.setText(product[productIndex].getLabel()+": "+buildAnalysis(strategie));
  }

  if (aantrek >1.67 && aantrek <3.33 && positie < 1.67) {
    strategie="M/L";
    product[productIndex].bang(25, "x");
    product[productIndex].bang(56, "y");
    analysisText.setText(product[productIndex].getLabel()+": "+buildAnalysis(strategie));
  }
  if (aantrek > 1.67 && aantrek<3.33 && positie >1.67 && positie < 3.33) {
    strategie="M/M";
    product[productIndex].bang(56, "x");
    product[productIndex].bang(56, "y");
    analysisText.setText(product[productIndex].getLabel()+": "+buildAnalysis(strategie));
  } 
  if (aantrek > 1.67 && aantrek < 3.33 && positie > 3.33) {
    strategie = "M/H";
    product[productIndex].bang(85, "x");
    product[productIndex].bang(56, "y");
    analysisText.setText(product[productIndex].getLabel()+": "+buildAnalysis(strategie));
  } 

  if (aantrek>0.0 && aantrek<1.67 && positie >0.0 && positie <1.67 ) {
    strategie="L/L";
    product[productIndex].bang(25, "x");
    product[productIndex].bang(25, "y");
    analysisText.setText(product[productIndex].getLabel()+": "+buildAnalysis(strategie));
  } 
  if (aantrek <1.67 && positie >1.67 && positie < 3.33) {
    strategie="L/M";
    product[productIndex].bang(56, "x");
    product[productIndex].bang(25, "y");
    analysisText.setText(product[productIndex].getLabel()+": "+buildAnalysis(strategie));
  } 
  if (aantrek < 1.67 && positie > 3.33) {
    strategie ="L/H";    
    product[productIndex].bang(85, "x");
    product[productIndex].bang(25, "y");
    analysisText.setText(product[productIndex].getLabel()+": "+buildAnalysis(strategie));
  }     
  return strategie;
}

public void loadXML() {
    loadXMLFile();  
}

public void saveXML() {
  String studentNaam = naam.getText(); 
  if (studentNaam.contains("volledige") || studentNaam.length()<5) {
    naam.setText("studentnaam niet goed!");
    naam.setColorBackground(color(255,0,0));
    return;
  }
  naam.setColorBackground(color(24,65,95));
  saveXMLFile();
}



void controlEvent(ControlEvent theEvent) {
  if(theEvent.isGroup()) {
    
//    if (theEvent.getGroup().getName().equals("products")){
      
//      product = ((int)theEvent.getGroup().getValue());      
//      teller++;
//      drawGUI();
//      println("Teller: "+teller);
//      println("Marktomvang van "+circle[product].getLabel()+" is: "+circle[product].getMarktOmvang());
//    }      
//  } else if (theEvent.isController()){
//    println("got something from a controller "
//            +theEvent.getController().getName()
//            );
                              
  }
  
}


