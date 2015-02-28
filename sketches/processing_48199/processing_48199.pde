
//Danbooru SFW Image Search Engine by Jonathan Tse, December 2011
//-------------------------------------------------------------------------------------------------------------------------------
//This program allows the user to enter search parameters that will go through Danbooru's database
//and return the latest 100 posts that have the search parameters, though the number of posts
//is easily changable by changing "limit=" in the baseSearchURL. if you do so, please make it divisible by
//10. you will also have to comment out part of the imageResults.update_page(), so that only the pages that
//are actually accessible are availible to choose from on the screen. i.e. if you have "limit=40", then
//you will have 4 pages, so you need to comment out from the else if statements after "page = 3" (page_over = 4)
//to before the else statement.
//
//This search engine is meant to be SFW (Safe For Work), but Danbooru has NSFW content. safe tags so far have been:
//-Dragon_ball_z+son_goku
//-pokemon
//any other tags may have NSFW content, which i attempted to prevent with the use of "rating=safe".
//the reason this is not fullproof is because posts can be changed by anyone, and some posts
//are not set correctly. I attempted to use Safebooru, the safe version of Danbooru, but their database
//uses PHP instead of XML which does not work with XMLElements (as far as i know).
//
//The search engine is located by clicking on "Menu", while the preview window is located by clicking on "Preview".
//A reset button is included when one wants to search again, without the lag of the processor.
//
// -------------------------------------NOTES------------------------------------------------------------
//
//NOTE: if you really want to see the full version of the image,
//one is provided at the bottom of Processing's print log when you click on the image you want to see. simply copypaste it
//in a browser, and it will present you with the full image by itself, as it is a direct image URL.

//NOTE: sometimes this program will malfunction, getting a 503 HTML error. no biggie, just run it again.
// ^----this has been noted as basically fixed.
//also, after a search has been processed, the menu buttons can be unresponsive. give it a moment :)
//there are println's that will print when the program actually reads a click for menus and images, so try to wait a minute
//after moving the mouse to where you want to click before clicking. i believe this is because the program is trying to log
//mouseX and mouseY while processing a large XML file and displaying contents while menu buttons are displayed.

//NOTICE: this program will crash if one of the posts is a .swf file. if so, use a different search term.

//if search results are shown, search menu will not work in that you cannot input keys correctly. reset the program before doing a new search.

PFont searchFont;
PFont titleFont;
PFont mainFont;
PFont creditFont;
searchButton mainMenu;
imageButton imgMenu;
resetButton manual_reset;
PImage img;
String search_values = "n/a";
String single_img_url = "none";
boolean reset = false;

String baseURL = "http://danbooru.donmai.us"; //the normal Danbooru URL.
String baseSearchURL = "http://danbooru.donmai.us/post/index.xml?limit=100&rating=safe&tags=-breasts+"; //somehow having -breasts works, its a safeguard against NSFW posts (still not fullproof)
String search_URL;
PFont font1;
PFont pageFont;
int num_posts;
int search_count = 0;
int preview_image_height, preview_image_width;

XMLElement xml;
XMLElement[] posts;

imageResults results;

void setup() {
  size(1000,600);
  frameRate(100);
  mainFont = loadFont("ArialMT-14.vlw");
  titleFont = loadFont("Impact-40.vlw");
  searchFont = loadFont("Calibri-15.vlw");
  creditFont = loadFont("Calibri-15.vlw");
  mainMenu = new searchButton(10,10,45,20,"Menu", mainFont, titleFont, searchFont, creditFont);
  imgMenu = new imageButton(60,10,65,20,"Preview", mainFont, titleFont, searchFont);
  manual_reset = new resetButton(130,10,45,20,"Reset", mainFont, searchFont);
  font1 = loadFont("ArialMT-14.vlw");
  pageFont = loadFont("pixoosy-40.vlw");
  results = new imageResults(baseURL, font1, pageFont);
}

void draw() {
  background(200);
  mainMenu.display();                                         //button displays
  imgMenu.display();
  manual_reset.display();
  if (search_values != "n/a") {                               //does only one loop per search entry to enter posts into the XMLElement array
    search_count++;
    search_URL = searchURL(search_values);
    xml = new XMLElement(this, search_URL);
    num_posts = xml.getChildCount();
    posts = xml.getChildren();
    results.getPosts(posts, num_posts);
    search_values = "n/a";
  }
  if (results.num_posts != 0) {                               //displays results
    results.display();
    if (results.detectImage() != "none" && results.detectImage() != single_img_url) {
      single_img_url = results.detectImage();
      preview_image_width = results.sendWidth();
      preview_image_height = results.sendHeight();
      results.pressed2 = false;
    }
    results.getSearchURL(search_URL);
  }
  mainMenu.update();
  if (mainMenu.menu_pressed) {                                 //displays search menu on press
     mainMenu.searchBar_update();
     mainMenu.searchButton_update();
     mainMenu.detect();
     search_values = mainMenu.return_search();
  }
  imgMenu.update();
  if (imgMenu.menu_pressed) {                                  //displays preview menu on press
    imgMenu.getImageData(single_img_url, preview_image_width, preview_image_height);
    imgMenu.detect();
    imgMenu.image_update();
    imgMenu.image_clicked();
  }
  //if (manual_reset.menu_pressed) {
    //manual_reset.reset_dialog();   //dialog box that is not needed. manual_reset is now an auto-reset button.
    //manual_reset.reset_update();
  //}
  manual_reset.update();
  if (manual_reset.menu_pressed) {
    reset = manual_reset.reset();
  }
  if (reset) {                               //resets all important variables
    results.num_posts = 0;                   //stops results from displaying
    mainMenu.menu_pressed = false;           //stops search menu from displaying
    imgMenu.menu_pressed = false;            //stops preview menu from displaying
    manual_reset.menu_pressed = false;       //stops reset button from looking like its pressed
    imgMenu.url = "none";                    //removes image from preview
    reset = false;                           //resets the reset lol
  }
}

void mousePressed() {
  mainMenu.menu_press();
  imgMenu.menu_press();
  manual_reset.menu_press();
  if (mainMenu.menu_pressed) {
    mainMenu.searchButton_press();
    mainMenu.searchBar_press();
  }
  if (imgMenu.menu_pressed) {
    imgMenu.image_press();
  }
  if (search_count != 0 && mainMenu.menu_pressed != true && imgMenu.menu_pressed != true && manual_reset.reset_pressed != true) { //i believe this makes it so you cannot change image or page when menus are open
    results.press_page();
    results.press_img();
  }
}

void keyReleased() {
  mainMenu.rep_count = 0;
}

String searchURL(String search_val) {
  String search_val_fixed = search_val.replace( " ", "+");
  String URL = baseSearchURL + search_val_fixed;
  return URL;
}

//search results display class
class imageResults {
  String search_url;
  String base_url;
  String imageURL;
  PFont f1;
  PFont f2;
  PImage img;
  int num_posts = 0;
  int page = 0;
  int current_page = 0;
  int img_over;
  int page_over;
  int total_pages;
  int select_page = 1;
  boolean pressed1 = false;
  boolean pressed2 = false;
  boolean over1 = false;
  boolean over2 = false;
  XMLElement[] p;
  String[] previewURL;
  String[] imgURL;
  int[] preWidth;
  int[] preHeight;
  int[] imgWidth;
  int[] imgHeight;
  

  imageResults(String baseURL, PFont font1, PFont font2) {
    base_url = baseURL;
    f1 = font1;
    f2 = font2;
  }
  
  void getPosts(XMLElement[] posts, int num) {
    p = posts;
    num_posts = num;
    total_pages = num_posts/10;
    previewURL = new String[num_posts];
    imgURL = new String[num_posts];
    preWidth = new int[num_posts];
    preHeight = new int[num_posts];
    imgWidth = new int[num_posts];
    imgHeight = new int[num_posts];
    for (int i=0; i < num_posts; i++) {
      imgURL[i] = p[i].getString("file_url");
      previewURL[i] = p[i].getString("preview_url");
      preWidth[i] = p[i].getInt("preview_width");
      preHeight[i] = p[i].getInt("preview_height");
      imgWidth[i] = p[i].getInt("width");
      imgHeight[i] = p[i].getInt("height");
    }
  }
  
  void getSearchURL(String search_URL) {
    search_url = search_URL;
  }

  void display() {
    update_page();
    update_img();
    imageDisplay();
    page_color_change();
    pageDirDisplay();
  }
  
  void imageDisplay() {
    for (int i=0; i < 10; i++) {
      imageMode(CENTER);
      rectMode(CENTER);
      int xpos, ypos;
      int post_add = 10*current_page;
      int post_value = i + post_add;
      if (i < 5) {
        ypos = 200;
        xpos = (i*210 + 85);
        if (img_over == i) {
          fill(230,40,50,130);
        } else {
          fill(170, 100, 230, 130);
        }
        strokeWeight(3);
        stroke(75, 130);
        rect(xpos, ypos, (preWidth[post_value]+10), (preHeight[post_value]+10));
        if (img_over == i) {
          tint(200);
        } else {
          tint(255);
        }
        if (previewURL[post_value] == "http://sonohara.donmai.us/download-preview.png") { //this unfortunately may not work, it was an attempt to prevent .swf posts from crashing the program
          img = loadImage(previewURL[post_value]);
        } else {
          img = loadImage((base_url + previewURL[post_value]));
        }
        image(img, xpos, ypos, preWidth[post_value], preHeight[post_value]);
      } else if (i >= 5) {
        ypos = 400;
        xpos = ((i-5)*210 + 85);
        if (img_over == i) {
          fill(230,40,50,130);
        } else {
          fill(170, 100, 230, 130);
        }
        strokeWeight(3);
        stroke(75, 130);
        rect(xpos, ypos, (preWidth[post_value]+10), (preHeight[post_value]+10));
        if (img_over == i) {
          tint(200);
        } else {
          tint(255);
        }
        if (previewURL[post_value] == "http://sonohara.donmai.us/download-preview.png") { //this unfortunately may not work, it was an attempt to prevent .swf posts from crashing the program
          img = loadImage(previewURL[post_value]);
        } else {
          img = loadImage((base_url + previewURL[post_value]));
        }
        image(img, xpos, ypos, preWidth[post_value], preHeight[post_value]);
    }
  }
  }
  
  void pageDirDisplay() {
    
    String page_str;
    textFont(f2);
    for (int i = 1; i <= total_pages; i++) {
      if (select_page == i) {
        fill(255);
      } else if (over1 && page_over == i) {
        fill(250,50,10);
      } else {
        fill(50,140,250);
      }
      page_str = Integer.toString(i);
      text(page_str, (((i-1)*90)+70), (height-25));
    }
  }
  
  void page_color_change() {
    if (pressed1) {
      select_page = page_over;
      current_page = page;
      pressed1 = false;
    }
  }
  
  void update_page() {
      if ((mouseX >= 70) && (mouseX <= 90) && (mouseY >= (height-50)) && (mouseY <= (height-25))) {
        over1 = true;
        page_over = 1;
        page = 0;
      } else if ((mouseX >= 160) && (mouseX <= 180) && (mouseY >= (height-50)) && (mouseY <= (height-25))) {
        over1 = true;
        page_over = 2;
        page = 1;
      } else if ((mouseX >= 250) && (mouseX <= 270) && (mouseY >= (height-50)) && (mouseY <= (height-25))) {
        over1 = true;
        page_over = 3;
        page = 2;
      } else if ((mouseX >= 340) && (mouseX <= 360) && (mouseY >= (height-50)) && (mouseY <= (height-25))) {
        over1 = true;
        page_over = 4;
        page = 3;
      } else if ((mouseX >= 430) && (mouseX <= 450) && (mouseY >= (height-50)) && (mouseY <= (height-25))) {
        over1 = true;
        page_over = 5;
        page = 4;
      } else if ((mouseX >= 520) && (mouseX <= 540) && (mouseY >= (height-50)) && (mouseY <= (height-25))) {
        over1 = true;
        page_over = 6;
        page = 5;
      } else if ((mouseX >= 610) && (mouseX <= 630) && (mouseY >= (height-50)) && (mouseY <= (height-25))) {
        over1 = true;
        page_over = 7;
        page = 6;
      } else if ((mouseX >= 700) && (mouseX <= 720) && (mouseY >= (height-50)) && (mouseY <= (height-25))) {
        over1 = true;
        page_over = 8;
        page = 7;
      } else if ((mouseX >= 790) && (mouseX <= 810) && (mouseY >= (height-50)) && (mouseY <= (height-25))) {
        over1 = true;
        page_over = 9;
        page = 8;
      } else if ((mouseX >= 880) && (mouseX <= 900) && (mouseY >= (height-50)) && (mouseY <= (height-25))) {
        over1 = true;
        page_over = 10;
        page = 9;
      } else {
        over1 = false;
      }
  }
  
  boolean press_page() {
    if (over1 == true && pressed1 == false) {
      pressed1 = true;
      println("page CLICK!");
      return true;
    } else {
      return false;
    }
  }
  
  void update_img() {
    if ((mouseX >= (85-(preWidth[(page*10)]/2))) && (mouseX <= (85+(preWidth[(page*10)]/2))) && (mouseY >= (200-((preHeight[(page*10)])/2))) && (mouseY <= (200+(preHeight[(page*10)])/2))) {
      img_over = 0;
      over2 = true;
    } else if ((mouseX >= (295-(preWidth[(page*10)+1]/2))) && (mouseX <= (295+(preWidth[(page*10)+1]/2))) && (mouseY >= (200-(preHeight[(page*10)+1])/2)) && (mouseY <= (200+(preHeight[(page*10)+1])/2))) {
      img_over = 1;
      over2 = true;
    } else if ((mouseX >= (505-(preWidth[(page*10)+2]/2))) && (mouseX <= (505+(preWidth[(page*10)+2]/2))) && (mouseY >= (200-(preHeight[(page*10)+2])/2)) && (mouseY <= (200+(preHeight[(page*10)+2])/2))) {
      img_over = 2;
      over2 = true;
    } else if ((mouseX >= (715-(preWidth[(page*10)+3]/2))) && (mouseX <= (705+(preWidth[(page*10)+3]/2))) && (mouseY >= (200-(preHeight[(page*10)+3])/2)) && (mouseY <= (200+(preHeight[(page*10)+3])/2))) {
      img_over = 3;
      over2 = true;
    } else if ((mouseX >= (925-(preWidth[(page*10)+4]/2))) && (mouseX <= (925+(preWidth[(page*10)+4]/2))) && (mouseY >= (200-(preHeight[(page*10)+4])/2)) && (mouseY <= (200+(preHeight[(page*10)+4])/2))) {
      img_over = 4;
      over2 = true;
    } else if ((mouseX >= (85-(preWidth[(page*10)+5]/2))) && (mouseX <= (85+(preWidth[(page*10)+5]/2))) && (mouseY >= (400-(preHeight[(page*10)+5])/2)) && (mouseY <= (400+(preHeight[(page*10)+5])/2))) {
      img_over = 5;
      over2 = true;
    } else if ((mouseX >= (295-(preWidth[(page*10)+6]/2))) && (mouseX <= (295+(preWidth[(page*10)+6]/2))) && (mouseY >= (400-(preHeight[(page*10)+6])/2)) && (mouseY <= (400+(preHeight[(page*10)+6])/2))) {
      img_over = 6;
      over2 = true;
    } else if ((mouseX >= (505-(preWidth[(page*10)+7]/2))) && (mouseX <= (505+(preWidth[(page*10)+7]/2))) && (mouseY >= (400-(preHeight[(page*10)+7])/2)) && (mouseY <= (400+(preHeight[(page*10)+7])/2))) {
      img_over = 7;
      over2 = true;
    } else if ((mouseX >= (715-(preWidth[(page*10)+8]/2))) && (mouseX <= (705+(preWidth[(page*10)+8]/2))) && (mouseY >= (400-(preHeight[(page*10)+8])/2)) && (mouseY <= (400+(preHeight[(page*10)+8])/2))) {
      img_over = 8;
      over2 = true;
    } else if ((mouseX >= (925-(preWidth[(page*10)+9]/2))) && (mouseX <= (925+(preWidth[(page*10)+9]/2))) && (mouseY >= (400-(preHeight[(page*10)+9])/2)) && (mouseY <= (400+(preHeight[(page*10)+9])/2))) {
      img_over = 9;
      over2 = true;
    } else {
      over2 = false;
    }
  }
  
  boolean press_img() {
    if (over2 == true && pressed2 == false) {
      pressed2 = true;
      println(imgURL[(img_over + (10*page))]);
      println("got 'em!");
      return true;
    } else if (over2 == true && pressed2 == true) {
      pressed2 = false;
      return false;
    } else {
      return false;
    }
  }
 
 
  String detectImage() {
    if (pressed2) {
      imageURL = imgURL[(img_over + (10*page))];
      return imageURL;
    } else {
      imageURL = "none";
      return imageURL;
    }
  }
  
  int sendWidth() {
    if (pressed2) {
      int imgWid = imgWidth[(img_over + (10*page))];
      return imgWid;
    } else {
      int imgWid = 0;
      return imgWid;
    }
  }
  
  int sendHeight() {
    if (pressed2) {
      int imgHei = imgHeight[(img_over + (10*page))];
      return imgHei;
    } else {
      int imgHei = 0;
      return imgHei;
    }
  }
  
}

class menuButton {
  float x, y;
  float w, h;
  boolean menu_over = false;
  boolean menu_pressed = false;
  PFont f1,f2,f3,f4;
  String search_str;
  String t;
  
  void display() {
    stroke(150);
    if (menu_over) {
      fill(255, 175);
    } else if (menu_pressed) {
      fill(100, 175);
    } else {
      fill(100, 75);
    }
    rectMode(CORNER);
    rect(x, y, w, h);
    textFont(f1);
    if (menu_over) {
      fill(75);
    } else if (menu_pressed) {
      fill(255);
    } else {
      fill(0);
    }
    text(t, (x+(w/10)), (y+(3*h/4)));
    }
  
  
  void update() {
    if (((mouseX <= (x + w)) && (mouseX >= x) && (mouseY <= (y+h)) && (mouseY >= y))) {
      menu_over = true;
    } else {
      menu_over = false;
    }
  }
  
  boolean menu_press() {
    if (menu_over == true && menu_pressed == false) {
      menu_pressed = true;
      println("Ca-LICK! open~");
      return true;
    } 
    else if (menu_over == true && menu_pressed == true) {
      menu_pressed = false;
      println("Ca-LICK! closed~");
      return false;
    }
    else {
      return false;
    }
  }
}
  
//the menu button and the main search window
class searchButton extends menuButton {
  boolean searchButton_over = false;
  boolean searchButton_pressed = false;
  boolean searchBar_over = false;
  boolean searchBar_pressed = false;
  String search_str = "";
  int rep_count = 0;
  
  searchButton(int xpos, int ypos, int wid, int heig, String txt, PFont font1, PFont font2, PFont font3, PFont font4) {
    x = xpos;
    y = ypos;
    w = wid;
    h = heig;
    t = txt;
    f1 = font1;
    f2 = font2;
    f3 = font3;
    f4 = font4;
  }
  
  void detect() {
    if (menu_pressed) {
      displaySearchMenu();
    }
  }
  
  void searchBar_update() {
    if ((mouseX <= ((width/2)+(width/6))) && (mouseX >= ((width/2)-(width/6))) && (mouseY <= ((3*height/5)-38)) && (mouseY >= ((3*height/5)-62))) {
      searchBar_over = true;
    } else {
      searchBar_over = false;
    }
  }
  
  boolean searchBar_press() {
    if (searchBar_over == true && searchBar_pressed == false && menu_pressed == true) {
      searchBar_pressed = true;
      return true;
    } else if (searchBar_over == false && searchBar_pressed == true) {
      searchBar_pressed = false;
      return false;
    } else {
      return false;
    }
  }
  
  void searchButton_update() {
    if ((mouseX <= ((width/2)+(width/20))) && (mouseX >= ((width/2)-(width/20))) && (mouseY <= ((3*height/5))) && (mouseY >= ((3*height/5)-20))) {
      searchButton_over = true;
    } else {
      searchButton_over = false;
    }
  }
  
  boolean searchButton_press() {
    if (searchButton_over == true && searchButton_pressed == false && menu_pressed == true) {
      searchButton_pressed = true;
      return true;
    } else {
      return false;
    }
  }
  
  void displaySearchMenu() {                                                //displays menu
    stroke(150, 175);
    fill(100,175);
    rectMode(CORNER);
    rect((x), (y+h+5), (width-(x+10)), (height-(y+h+15)));                  //menu border
    textFont(f2);
    stroke(20);
    fill(255);
    text("pwnsearch", (4*width/10)+10, (height/2)-50);                       //title
    stroke(50, 175);
    if (searchBar_pressed) {
      fill(255);
    } else {
      fill(200, 175);
    }
    rectMode(CENTER);
    rect((width/2),(3*height/5)-50, (width/3), 25);                         //search bar
    textFont(f1);
    fill(0);
    text("Searches through Danbooru's database to bring you the best in anime and video game art.", (7*width/24)-65, (3*height/4)-30);
    textFont(f4);
    fill(0);
    text("Brought to you by Jonathan Tse.", (width-215), (height-20));
    fill(100);
    text("Tip: Use underscores (_) for spaces in a tag and use spaces between tags (i.e son_goku dragon_ball_z)", (7*width/24)-90, (3*height/4));
    if (searchBar_pressed) {                                                //keyboard input
      if (keyPressed && (rep_count == 0)) {
        if (key != CODED) {
          if (key == BACKSPACE) {                                           //code for erasing letters
            int l = (search_str.length() - 1);
            if (l > 0) {
              search_str = search_str.substring(0, l);
              rep_count++;
            } else if (l == 0) {
                search_str = "";
            }
          } else if (key == ENTER) {                                        //affects the return_search() function
            searchButton_pressed = true;
          } else {
            search_str += key;                                              //actually adds the key input to the str
            rep_count++;                                                    //prevents repetition by holding down the key, which was allowing for way too many keyboard inputs per keypress
          }
        }
      }
    }
    textFont(f3);
    text(search_str, (width/2)-160, (3*height/5)-43);                        //displays on screen the search values typed so far
    if (searchButton_over) {
      fill(240);
    } else if (searchButton_pressed) {
      fill(100);
    } else {
      fill(180);
    }
    rect((width/2),((3*height/5)-10), (width/10), 20);                      //search button
    textFont(f1);
    if (searchButton_over) {
      fill(0);
    } else {
      fill(255);
    }
    text("SEARCH", ((width/2)-27), ((3*height/5)-4));
  }
  
  String return_search() {                                                  //gives to the searchURL editor the 'tags' to search for or 'n/a'
    if (searchButton_pressed) {
      String send = search_str;
      search_str = "";
      menu_pressed = false;
      searchButton_pressed = false;                                         //resets both boolean values so that the menu and search button are accessible
      return send;
    } else {
      return "n/a";
    }
  }
}

//image button and menu
class imageButton extends menuButton {
  String url;
  PImage img;
  float imgW, imgH;
  int alt_w, alt_h;
  float ratio;
  boolean image_over = false;
  boolean image_pressed = false;
  
  imageButton(int xpos, int ypos, int wid, int heig, String txt, PFont font1, PFont font2, PFont font3) {
    x = xpos;
    y = ypos;
    w = wid;
    h = heig;
    t = txt;
    f1 = font1;
    f2 = font2;
    f3 = font3;
  }
  
  void detect() {
    if (menu_pressed) {
      displayImageMenu();
    }
  }
  
  
  void getImageData(String imgURL, int imgWidth, int imgHeight) {
    if (url != imgURL && url != "none") {
      url = imgURL;
    }
    imgW = imgWidth;
    imgH = imgHeight;
    
  }
  
  void displayImageMenu() { //displays menu
    stroke(150, 175);
    fill(100,175);
    rectMode(CORNER);
    rect((10), (y+h+5), (width-(25)), (height-(y+h+15)));//menu border
    imageMode(CENTER);
    if ((imgW >= (width-35)) || (imgH >= (height-75))) { //resizing the image to fit the screen (some images are 'absurdres', otherwise known as very large resolution)
      ratio = imgW/imgH;
      float page_ratio = 1000.0/600.0;
      if (ratio > page_ratio) {
        alt_w = width-200;
        alt_h = int(alt_w/ratio);
      } else {
        alt_h = height-135;
        alt_w = int(alt_h * ratio);
      } 
    } else {
      alt_w = int(imgW);
      alt_h = int(imgH);
    }
    if (url != "none") {
      img = loadImage(url);
      image(img, (width-15)/2, (height+30)/2, alt_w, alt_h);
    } else {
      println("no image... :(");
    }
  }
  
  void image_update() {
    if ((mouseX <= (((width-15)/2)+((alt_w)/2))) && (mouseX >= (((width-15)/2)-((alt_w)/2))) && (mouseY <= (((height+30)/2)+((alt_h)/2))) && (mouseY >= (((height+30)/2)-((alt_h)/2)))) {
      image_over = true;
    } else {
      image_over = false;
    }
  }
  
  boolean image_press() {
    if (image_over == true && image_pressed == false && menu_pressed == true) {
      image_pressed = true;
      return true;
    } else {
      return false;
    }
  }
  
  void image_clicked() {
    if (image_pressed && url!="none") {
      link(url, "_new");
      image_pressed = false;
    }
  }
}

class resetButton extends menuButton {
  boolean reset_on = false;
  boolean reset_pressed = false;
  
  resetButton(int xpos, int ypos, int wid, int hei, String txt, PFont font1, PFont font2) {
    x = xpos;
    y = ypos;
    w = wid;
    h = hei;
    t = txt;
    f1 = font1;
    f2 = font2;
  }
  
  boolean reset() {
    if (manual_reset.menu_pressed) {
      reset_on = true;
      println("~reset!");
      return true;
    } else {
      return false;
    }
  }
  //this is a dialog box, but its not needed. having an auto-reset button is more useful in this situation.
  /*
  void reset_dialog() {
    if (menu_pressed) {
      rectMode(CENTER);
      stroke(0);
      fill(100, 175);
      rect(width/2, height/2, 300, 200); //dialog box
      fill(255);
      textFont(f2);
      text("Do you really want to reset the search?", (width/2)-120, (height/2)-50);
      if (reset_over) {
        stroke(100);
        fill(255);
      } else if (reset_pressed) {
        stroke(255);
        fill(50, 75);
      } else {
        stroke(255);
        fill(200,75);
      }
      rect((width/2),((height/2)+45), (width/10), 30);                      //yes button
      textFont(f1);
      if (reset_over) {
        fill(0);
      } else if (reset_pressed) {
        fill(255);
      } else {
        fill(0);
      }
      text("YES", ((width/2)-12), ((height/2)+50));
    }
  }
  
  void reset_update() {
    if (menu_over) {
      reset_over = true;
    } else {
      reset_over = false;
    }
  }
  
  boolean reset_press() {
    if (reset_over == true && reset_pressed == false && menu_pressed == true) {
      reset_pressed = true;
      menu_pressed = false;
      return true;
    } else {
      return false;
    }
  }*/
  
}
      

