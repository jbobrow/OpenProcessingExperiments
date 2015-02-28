
PFont font;
XMLElement xml;
Response[] resp;
char sortVal;
int frame = 150;
int tableHeight = 500;
int tableWidth =1300;

void setup() {
  size(1600, 800);
  font = loadFont("GillSansMT-48.vlw");
  textFont(font);
  textAlign(CENTER, CENTER);
  smooth();
  noFill();

  xml = new XMLElement(this, "KPCC_2011-12-12c.xml"); //get this file
  XMLElement[] row = xml.getChildren("row");

  resp = new Response[row.length];

  for (int i=0; i<resp.length; i++) {
    int gender = int(row[i].getChild("male1female2").getContent());
    int donation = int(row[i].getChild("Donation").getContent());
    int age = int(row[i].getChild("listnerAge").getContent());
    int zipCode = int(row[i].getChild("ZipCode").getContent());
    int hours = int(row[i].getChild("ListenHoursPerDay").getContent());

    int wLocalN = int(row[i].getChild("LocalNewsPolitics1-5").getContent());
    int	wArt = int(row[i].getChild("ArtsEntertainment1-5").getContent());
    int	wBusiness = int(row[i].getChild("BusinessMoney1-5").getContent());
    int	wFamily = int(row[i].getChild("KidsFamily1-5").getContent());
    int	wGlobalN = int(row[i].getChild("GlobalNewsPolitics1-5").getContent());
    int	wPCulture = int(row[i].getChild("PopularCulture1-5").getContent());
    int	wSpirit	= int(row[i].getChild("ReligionSpirituality1-5").getContent());
    int	wMed = int(row[i].getChild("ScienceMedicine1-5").getContent());
    int	wSport = int(row[i].getChild("Sports1-5").getContent());
    int	wTech = int(row[i].getChild("Technology1-5").getContent());

    int isLocalN = int(row[i].getChild("LocalNewsPolitics1-5_KPCC").getContent());
    int	isArt = int(row[i].getChild("ArtsEntertainment1-5_KPCC").getContent());
    int	isBusiness = int(row[i].getChild("BusinessMoney1-5_KPCC").getContent());
    int	isFamily = int(row[i].getChild("KidsFamily1-5_KPCC").getContent());
    int	isGlobalN = int(row[i].getChild("GlobalNewsPolitics1-5_KPCC").getContent());
    int	isPCulture = int(row[i].getChild("PopularCulture1-5_KPCC").getContent());
    int	isSpirit = int(row[i].getChild("ReligionSpirituality1-5_KPCC").getContent());
    int	isMed = int(row[i].getChild("ScienceMedicine1-5_KPCC").getContent());
    int	isSport	= int(row[i].getChild("Sports1-5_KPCC").getContent());
    int	isTech = int(row[i].getChild("Technology1-5_KPCC").getContent());

    resp[i] = new Response(donation, age, gender, zipCode, hours, 
    wLocalN, wArt, wBusiness, wFamily, wGlobalN, wPCulture, wSpirit, wMed, wSport, wTech, 
    isLocalN, isArt, isBusiness, isFamily, isGlobalN, isPCulture, isSpirit, isMed, isSport, isTech);
  }
}

void draw() {
  background(20);
  fill(0, 102, 153);


  translate(frame, frame+tableHeight);
  textFont(font);
  textSize(22);
  textAlign(RIGHT, CENTER); 
  text("	Local	", -30, 	0	);
  text("	Art	", -30, 	-50	);
  text("	Business", -30, 	-100	);
  text("	Family	", -30, 	-150	);
  text("	World	", -30, 	-200	);
  text("	Culture	", -30, 	-250	);
  text("	Spiritual", -30, 	-300	);
  text("	Med	", -30, 	-350	);
  text("	Sport	", -30, 	-400	);
  text("	Tech	", -30, 	-450	);

  textAlign(LEFT, CENTER);
  text("	Local News", 1300, 	0	);
  text("	Art	", 1300, 	-50	);
  text("	Business", 1300, 	-100	);
  text("	Family	", 1300, 	-150	);
  text("	News	", 1300, 	-200	);
  text("	Culture	", 1300, 	-250	);
  text("	Spiritual", 1300, 	-300	);
  text("	Med	", 1300, 	-350	);
  text("	Sport	", 1300, 	-400	);
  text("	Tech	", 1300, 	-450	);

  for (int i=0; i<resp.length; i++) 
  {
    resp[i].display((i*60), 0);
  }

  for (int i=0; i<resp.length; i++)
  {
    float tmpX = resp[i].x;
    float tmpD = dist (mouseX, mouseY, tmpX+frame, -resp[i].donation);
    if (tmpD <= 20)//resp[i].wLocalN*3)
    {
      fill (255, 0, 0);
      ellipse (tmpX, -resp[i].donation, 10, 10);
    }
  }
}

void keyPressed()
{
  if (key=='a')
  {
    sortVal='a';
  }
  else if (key=='g')
  {
    sortVal='g';
  }
  else if (key=='d')
  {
    sortVal='d';
  }
  else if (key=='z')
  {
    sortVal='z';
  }
  else if (key=='h')
  {
    sortVal='h';
  }
  else
  {
    println("Not a valid sort option");
  }
  Arrays.sort(resp);
}


