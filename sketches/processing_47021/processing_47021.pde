
int toggle=0;
int numImages=74;
PImage[] myImages=new PImage[numImages];

void setup() {
  size (800, 500);
  background(0);
  imageMode(CENTER);
    
  myImages[0]= loadImage ("+1.jpg");
  myImages[1]= loadImage ("About.jpg");
  myImages[2]= loadImage ("AddPhoto.jpg");
  myImages[3]= loadImage ("AddToCart.jpg");
  myImages[4]= loadImage ("AddtoCircles.jpg");
  myImages[5]= loadImage ("AmazonMenu.jpg");
  myImages[6]= loadImage ("AppleMenu.jpg");
  myImages[7]= loadImage ("AskQuestion.jpg");
  myImages[8]= loadImage ("BuyNow.jpg");
  myImages[9]= loadImage ("Cancel.jpg");
  myImages[10]= loadImage ("Cart.jpg");
  myImages[11]= loadImage ("Categories.jpg");
  myImages[12]= loadImage ("Comedy.jpg");
  myImages[13]= loadImage ("Comment.jpg");
  myImages[14]= loadImage ("Compose.jpg");
  myImages[15]= loadImage ("Delete.jpg");
  myImages[16]= loadImage ("EditProfile_2.jpg");
  myImages[17]= loadImage ("EditProfile.jpg");
  myImages[18]= loadImage ("Entertainment.jpg");
  myImages[19]= loadImage ("FBMenu.jpg");
  myImages[20]= loadImage ("Film&Ani.jpg");
  myImages[21]= loadImage ("FindUsOnFB.jpg");
  myImages[22]= loadImage ("Follow.jpg");
  myImages[23]= loadImage ("Friends.jpg");
  myImages[24]= loadImage ("Gaming.jpg");
  myImages[25]= loadImage ("GetDirection.jpg");
  myImages[26]= loadImage ("Google+Nav.jpg");
  myImages[27]= loadImage ("Help.jpg");
  myImages[28]= loadImage ("ImOver18.jpg");
  myImages[29]= loadImage ("Info.jpg");
  myImages[30]= loadImage ("Insert.jpg");
  myImages[31]= loadImage ("InviteFriends.jpg");
  myImages[32]= loadImage ("JoinDecline.jpg");
  myImages[33]= loadImage ("LearnMore.jpg");
  myImages[34]= loadImage ("Like.jpg");
  myImages[35]= loadImage ("Login_2.jpg");
  myImages[36]= loadImage ("Login.jpg");
  myImages[37]= loadImage ("Message.jpg");
  myImages[38]= loadImage ("MostViewToday.jpg");
  myImages[39]= loadImage ("MyPlaces.jpg");
  myImages[40]= loadImage ("Navigation.jpg");
  myImages[41]= loadImage ("NewFolder.jpg");
  myImages[42]= loadImage ("NewOpen.jpg");
  myImages[43]= loadImage ("Nonprofits&Act.jpg");
  myImages[44]= loadImage ("Okay.jpg");
  myImages[45]= loadImage ("Open.jpg");
  myImages[46]= loadImage ("People&Blogs.jpg");
  myImages[47]= loadImage ("Person.jpg");
  myImages[48]= loadImage ("Pets&Animals.jpg");
  myImages[49]= loadImage ("Photos.jpg");
  myImages[50]= loadImage ("Print.jpg");
  myImages[51]= loadImage ("RecommendedTopics.jpg");
  myImages[52]= loadImage ("RecordFromWebcam.jpg");
  myImages[53]= loadImage ("Save.jpg");
  myImages[54]= loadImage ("Science&Tech.jpg");
  myImages[55]= loadImage ("Search.jpg");
  myImages[56]= loadImage ("SendMessage.jpg");
  myImages[57]= loadImage ("Settings.jpg");
  myImages[58]= loadImage ("ShowNow.jpg");
  myImages[59]= loadImage ("SignUp.jpg");
  myImages[60]= loadImage ("Sports.jpg");
  myImages[61]= loadImage ("StartaHangout.jpg");
  myImages[62]= loadImage ("StartPosting.jpg");
  myImages[63]= loadImage ("Travel&Events.jpg");
  myImages[64]= loadImage ("TwitterMenu.jpg");
  myImages[65]= loadImage ("Unfollow.jpg");
  myImages[66]= loadImage ("UpdateStatus.jpg");
  myImages[67]= loadImage ("UploadPhotos.jpg");
  myImages[68]= loadImage ("UploadVideo.jpg");
  myImages[69]= loadImage ("ViewMenu.jpg");
  myImages[70]= loadImage ("Wall.jpg");
  myImages[71]= loadImage ("Window.jpg");
  myImages[72]= loadImage ("WishList.jpg");
  myImages[73]= loadImage ("YTMenu.jpg");
  
}

void draw() {
  background(0);
  image(myImages[toggle%numImages], 400, 240);
}

void mousePressed(){
  toggle++;
}




