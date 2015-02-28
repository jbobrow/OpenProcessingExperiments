
//Created by Alvin To
//SFU Financial Aid and Awards - Budget Estimator
//updated on June 6, 2013

import processing.opengl.PGraphicsOpenGL;
import controlP5.*;

public ControlP5 controlP5;
public ControlFont pfont, dfont, qfont, sfont, tfont, titlefont;
public controlP5.Button est;

public ControlP5 cp5;

public PImage img;

public Textlabel immigration, program, units, summer, fall, spring, additionalExpenses;
public Textlabel tuitionLabel, booksLabel, studentFeeLabel, housingLabel;
public Textlabel summerSem, fallSem, springSem;
public Textlabel summerTuitionValue, springTuitionValue, fallTuitionValue;
public Textlabel summerBooksValue, springBooksValue, fallBooksValue;
public Textlabel summerStudentFeeValue, springStudentFeeValue, fallStudentFeeValue;
public Textlabel springStudentServValue, fallStudentServValue;
public Textlabel summerRecValue, springRecValue, fallRecValue;
public Textlabel summerUpassValue, springUpassValue, fallUpassValue;
public Textlabel summerHealthValue, springHealthValue, fallHealthValue;
public Textlabel summerHousingValue, springHousingValue, fallHousingValue;
public Textlabel summerHealthDentalPlanLabel;
public Textlabel checkApply;
public Textlabel healthPlanLabel;
public Textlabel utilityCostsLabel;
public Textlabel educationalSubTotalLabel, summerEducationalSubTotalValue, springEducationalSubTotalValue, fallEducationalSubTotalValue;
public Textlabel AddExpensesSubTotalLabel, summerAddExpensesSubTotalValue, springAddExpensesSubTotalValue, fallAddExpensesSubTotalValue;
public Textlabel mspLabel, summerMSPValue, springMSPValue, fallMSPValue;
public Textlabel miscellaneousLabel, summerMiscellaneousValue, springMiscellaneousValue, fallMiscellaneousValue;
public Textlabel semesterTotalLabel, summerTotalValue, springTotalValue, fallTotalValue;
public Textlabel grandTotalLabel, grandTotalValue;
public Textlabel domesticEngineeringSciLabel, domesticComputingSciLabel, domesticBusinessAdminLabel;
public Textlabel interEngineeringSciLabel, interComputingSciLabel, interBusinessAdminLabel;
public Textlabel summerUnitsValue, springUnitsValue, fallUnitsValue;
public Textlabel facultyValue, typeStudentValue;
public Textlabel undergradTitle;
public Textlabel lastUpdated;
public Textlabel typicalCourseUnit;
public Textlabel noteHealthDental, noteHealthDental2, noteHealthDental3, noteHealthDental4, noteMSP, noteLivingCosts, noteMSP2, noteLivingCosts2;

public Textlabel errorMessage;

public Textlabel canadianCheckText;
public Textlabel internationalCheckText;
public Textlabel appliedSciencesCheckText;
public Textlabel artsSocialSciencesCheckText;
public Textlabel businessAdministrationCheckText;
public Textlabel communicationArtTechnologyCheckText;
public Textlabel educationCheckText;
public Textlabel environmentCheckText;
public Textlabel healthSciencesCheckText;
public Textlabel scienceCheckText;
public Textlabel housingCostsCheckTextYes;
public Textlabel utilitiesCheckTextYes;
public Textlabel mspFeeCheckTextYes;
public Textlabel miscellaneousCostsCheckTextYes;


public DropdownList p1, p2, p3;

public boolean chartOpen;

public boolean TrueCanadianStudent = false;
public boolean TrueInternationalStudent = false;
public boolean TrueAppliedSciences = false;
public boolean TrueArtsSocialSciences = false;
public boolean TrueBusiness = false;
public boolean TrueCommunicationArtTech = false;
public boolean TrueEducation = false;
public boolean TrueEnvironment = false;
public boolean TrueHealthSciences = false;
public boolean TrueScience = false;
public boolean TrueHousing = false;
public boolean TrueUtilities = false;
//public boolean TrueInternet = false;
public boolean TrueMSP = false;
public boolean TrueMiscellaneous = false;
public boolean TrueSummerCoop = false;
public boolean TrueSpringCoop = false;
public boolean TrueFallCoop = false;


//Fee Constants CHANGE VALUES HERE
public int domesticTuitionPerUnit = 167;//163.75; //canadian student tuition //++++++++++++++++++
public int interTuitionPerUnit = 541;//527.20; //international student tuition //++++++++++++++++++
public int ConbooksFee = 61;//58.33; //books and supplies fee //++++++++++++++++++
public int ConstudentServicesFee = 41;//39.39; //student services fee
public int coopStudentServicesFee = 0;//coop student does not need to pay
public int recreationFee3units = 34;//32.82; //recreation-athletic fee for 3 or fewer units
public int recreationFee4units = 68;//65.65; //recreation-athletic fee for 4 or more units
public int coopRecreationFee = 0;//coop student does not need to pay
public int studentActivityFee3units = 33;//32.09;//student activity fee for 3 or fewer units
public int coopStudentActivityFee = 33;//coop student pays half
public int studentActivityFee4units = 67;//64.14;//student activity fee for 4 or more units
public int ConupassFee = 120;//104.36; //u-pass fee
public int healthPlanCostsFALL = 198; //health and dental plan for student enrolled in fall
public int healthPlanCostsSPRING = 132; //health and dental plan for student enrolled in spring
public int healthPlanCostsSUMMER = 0; //health and dental plan for student enrolled in summer
public int housingCosts = 2640; // accommadation/housing cost //++++++++++++++++++
//public int utilityCosts = 480; //utilities (includes water, electricity, gas)
//public int internetFees = 260; //120 internet fee
public int mspFee = 256; //Medical Services Plan fee
public int miscellaneousCosts = 1650; //miscellaneous fee (ex. clothing, toiletries)
public int summerEducationalSubTotal = 0; //summer educational subtotal
public int fallEducationalSubTotal = 0; //fall educational subtotal
public int springEducationalSubTotal = 0; //spring educational subtotal
public int summerAddExpensesSubTotal = 0; //summer additional expenses subtotal
public int springAddExpensesSubTotal = 0; //spring additional expenses subtotal
public int fallAddExpensesSubTotal = 0; //fall additional expenses subtotal
public int summerTotal = 0;//summer total costs
public int springTotal = 0;//spring total costs
public int fallTotal = 0;//fall total costs
public int grandTotal = 0; //estimated grand total
public int coopFees = 706; //coop fees
public int fallStudentFee = 0;
public int springStudentFee = 0;
public int summerStudentFee = 0;


public int summerTuition, fallTuition, springTuition;
public int fallBooksTotal, springBooksTotal, summerBooksTotal;
public int summerstudentServicesFee, fallstudentServicesFee, springstudentServicesFee;
public int summerRecreationFee, fallRecreationFee, springRecreationFee;
public int summerStudentActivityFee, fallStudentActivityFee, springStudentActivityFee;
public int summerUpassFee, fallUpassFee, springUpassFee;
public int summerHealthCosts, springHealthCosts, fallHealthCosts;
public int summerHousingCosts, fallHousingCosts, springHousingCosts;
//public int summerInternet, fallInternet, springInternet;
public int summerMSP, fallMSP, springMSP;
public int summerMiscellaneous, springMiscellaneous, fallMiscellaneous; 
//public int summerUtilityCosts, fallUtilityCosts, springUtilityCosts;
public int summerUnits, springUnits, fallUnits;


public int fallUnitsHolder;
public int springUnitsHolder;
public int summerUnitsHolder;

public int yOffset = 0;
public int xOffset = 83;

void setup() 
{
  //  img = loadImage("x.png");

  PImage[] imgs = {
    loadImage("unchecked.png"), loadImage(""), loadImage("checked_red.png")
    };

    cp5 = new ControlP5(this);

  size(560, 678);
  smooth();

  fill(0);

  cp5 = new ControlP5(this);
  controlP5 = new ControlP5(this);

  controlP5.setMoveable(false);

  PFont pFont = createFont("Arial", 13, true);
  PFont dFont = createFont("Arial", 12, true);
  PFont qFont = createFont("Arial", 18, true);
  PFont sFont = createFont("Arial", 15, true);
  PFont tFont = createFont("Arial", 21, true);
  PFont titleFont = createFont("Arial", 35, true);

  pfont = new ControlFont(pFont);
  dfont = new ControlFont(dFont);
  qfont = new ControlFont(qFont);
  sfont = new ControlFont(sFont);
  tfont = new ControlFont(tFont);
  titlefont = new ControlFont(titleFont);

  controlP5.setControlFont(pfont);

  //Estimate button
  controlP5.addButton("Estimate", 100, 500 - 100, 740 - 150, 100, 50).setId(1); //500
  controlP5.controller("Estimate").captionLabel().setControlFont(qfont);
  controlP5.controller("Estimate").captionLabel().setControlFontSize(10);
  controlP5.controller("Estimate").setColorBackground(color(155, 36, 46));
  controlP5.controller("Estimate").setColorForeground(color(230, 42, 42));
  controlP5.controller("Estimate").setColorActive(color(230, 42, 42));//(41, 70, 131));
  controlP5.controller("Estimate").captionLabel().toUpperCase(false);
  controlP5.controller("Estimate").captionLabel().setControlFont(sfont);
  controlP5.controller("Estimate").captionLabel().style().marginLeft = 10;

  //Immigration question
  immigration = controlP5.addTextlabel("immigrationQuestion", "1) I am...", 80 - xOffset, 30 + yOffset);
  immigration.setColorValue(color(155, 36, 46));
  immigration.setControlFont(qfont);

  canadianCheckText = controlP5.addTextlabel("canadianCheckText", "a Canadian student/permanent resident", 150 - xOffset, 75 + yOffset);
  canadianCheckText.setColorValue(color(0));
  internationalCheckText = controlP5.addTextlabel("international", "an international student", 460 - xOffset, 75 + yOffset); //430
  internationalCheckText.setColorValue(color(0));

  cp5.addToggle("Yes, I am a Canadian student.")
    .setValue(0)
      .setPosition(120 - xOffset, 70 + yOffset)
        .setImages(imgs)
          .updateSize()
            ; 
  cp5.addToggle("No, I am an international student.")
    .setValue(0)
      .setPosition(430 - xOffset, 70 + yOffset)
        .setImages(imgs)
          .updateSize()
            ;

  //Program question
  program = controlP5.addTextlabel("programQuestion", "2) Which faculty are you interested/enrolled in?", 80 - xOffset, 120 + yOffset);
  program.setColorValue(color(155, 36, 46));
  program.setControlFont(qfont);

  appliedSciencesCheckText = controlP5.addTextlabel("appliedSciencesCheckText", "Applied Sciences", 150 - xOffset, 165 + yOffset);
  appliedSciencesCheckText.setColorValue(color(0));
  artsSocialSciencesCheckText = controlP5.addTextlabel("artsSccialSciencesCheckText", "Arts and Social Sciences", 150 - xOffset, 205 + yOffset);
  artsSocialSciencesCheckText.setColorValue(color(0));
  businessAdministrationCheckText = controlP5.addTextlabel("businessAdministrationCheckText", "Business Administration", 150 - xOffset, 245 + yOffset);
  businessAdministrationCheckText.setColorValue(color(0));
  communicationArtTechnologyCheckText = controlP5.addTextlabel("communicationArtTechnologyCheckText", "Communication, Art and Technology", 150 - xOffset, 285 + yOffset);
  communicationArtTechnologyCheckText.setColorValue(color(0));
  educationCheckText = controlP5.addTextlabel("EducationCheckText", "Education", 460 - xOffset, 165 + yOffset);
  educationCheckText.setColorValue(color(0));
  environmentCheckText = controlP5.addTextlabel("environmentCheckText", "Environment", 460 - xOffset, 205 + yOffset);
  environmentCheckText.setColorValue(color(0));
  healthSciencesCheckText = controlP5.addTextlabel("healthSciencesCheckText", "Health Sciences", 460 - xOffset, 245 + yOffset);
  healthSciencesCheckText.setColorValue(color(0));
  scienceCheckText = controlP5.addTextlabel("scienceCheckText", "Science", 460 - xOffset, 285 + yOffset);
  scienceCheckText.setColorValue(color(0));

  cp5.addToggle("Applied Sciences")
    .setValue(0)
      .setPosition(120 - xOffset, 160 + yOffset)
        .setImages(imgs)
          .updateSize()
            ;

  cp5.addToggle("Arts and Social Science")
    .setValue(0)
      .setPosition(120 - xOffset, 200 + yOffset)
        .setImages(imgs)
          .updateSize()
            ;
  cp5.addToggle("Business Administration")
    .setValue(0)
      .setPosition(120 - xOffset, 240 + yOffset)
        .setImages(imgs)
          .updateSize()
            ; 
  cp5.addToggle("Communication, Art & Technology")
    .setValue(0)
      .setPosition(120 - xOffset, 280 + yOffset)
        .setImages(imgs)
          .updateSize()
            ; 
  cp5.addToggle("Education")
    .setValue(0)
      .setPosition(430 - xOffset, 160 + yOffset)
        .setImages(imgs)
          .updateSize()
            ; 
  cp5.addToggle("Environment")
    .setValue(0)
      .setPosition(430 - xOffset, 200 + yOffset)
        .setImages(imgs)
          .updateSize()
            ; 
  cp5.addToggle("Health Sciences")
    .setValue(0)
      .setPosition(430 - xOffset, 240 + yOffset)
        .setImages(imgs)
          .updateSize()
            ; 
  cp5.addToggle("Science")
    .setValue(0)
      .setPosition(430 - xOffset, 280 + yOffset)
        .setImages(imgs)
          .updateSize()
            ; 

  //expenses
  additionalExpenses = controlP5.addTextlabel("addExpensesQuestion", "4) I may also have additional living costs.", 80 - xOffset, 445 + yOffset);
  additionalExpenses.setColorValue(color(155, 36, 46));
  additionalExpenses.setControlFont(qfont);
  checkApply = controlP5.addTextlabel("checkApply", "(Check all that apply)", 110 - xOffset, 470 + yOffset);
  checkApply.setColorValue(color(0));
  checkApply.setControlFont(sfont);

  housingCostsCheckTextYes = controlP5.addTextlabel("housingCostsCheckTextYes", "Campus Residence (average cost for single student)", 150 - xOffset, 505 + yOffset);
  housingCostsCheckTextYes.setColorValue(color(0));

  mspFeeCheckTextYes = controlP5.addTextlabel("mspFeeCheckTextYes", "BC Medical Services Plan", 150 - xOffset, 545 + yOffset);
  mspFeeCheckTextYes.setColorValue(color(0));
  miscellaneousCostsCheckTextYes = controlP5.addTextlabel("miscellaneousCostsCheckTextYes", "Food (based on Residence meal plan)", 150 - xOffset, 585 + yOffset);
  miscellaneousCostsCheckTextYes.setColorValue(color(0));

  cp5.addToggle("Campus Residence")
    .setValue(0)
      .setPosition(120 - xOffset, 500 + yOffset)
        .setImages(imgs)
          .updateSize()
            ;
  cp5.addToggle("MSP Fee")
    .setValue(0)
      .setPosition(120 - xOffset, 540 + yOffset)
        .setImages(imgs)
          .updateSize()
            ; 
  cp5.addToggle("Miscellaneous Costs")
    .setValue(0)
      .setPosition(120 - xOffset, 580 + yOffset)
        .setImages(imgs)
          .updateSize()
            ;
  cp5.setColorLabel(color(255, 255, 255));
  cp5.setColorForeground(color(155, 36, 46));
  cp5.setColorActive(color(155, 36, 46));
  cp5.setColorBackground(color(73, 72, 64));

  //units question
  units = controlP5.addTextlabel("units", "3) How many units will you be taking?", 80 - xOffset, 330 + yOffset);
  units.setColorValue(color(155, 36, 46));
  units.setControlFont(qfont);

  typicalCourseUnit = controlP5.addTextlabel("typicalCourseUnit", "(Typical course = 3 units)", 110 - xOffset, 355 + yOffset);
  typicalCourseUnit.setColorValue(color(0));
  typicalCourseUnit.setControlFont(sfont);

  fall = controlP5.addTextlabel("fall", "Fall term", 120 - xOffset, 380 + yOffset);
  fall.setColorValue(color(0));
  fall.setControlFont(sfont);
  spring = controlP5.addTextlabel("spring", "Spring term", 270 - xOffset, 380 + yOffset);
  spring.setColorValue(color(0));
  spring.setControlFont(sfont);
  summer = controlP5.addTextlabel("summer", "Summer term", 420 - xOffset, 380 + yOffset);
  summer.setColorValue(color(0));
  summer.setControlFont(sfont);

  p1 = controlP5.addDropdownList("Fall Term", 120 - xOffset, 425 + yOffset, 100, 120);
  customize(p1);
  p1.setHeight(150);
  p1.setColorForeground(color(155, 36, 46));
  p1.setColorLabel(color(255));
  p2 = controlP5.addDropdownList("Spring Term", 270 - xOffset, 425 + yOffset, 100, 120);
  customize(p2);
  p2.setHeight(150);
  p2.setColorForeground(color(155, 36, 46));
  p2.setColorLabel(color(255));
  p3 = controlP5.addDropdownList("Summer Term", 420 - xOffset, 425 + yOffset, 100, 120);
  customize(p3);
  p3.setHeight(150);
  p3.setColorForeground(color(155, 36, 46));
  p3.setColorLabel(color(255));

  //Labels after estimate button is clicked
  //Tuition
  tuitionLabel = controlP5.addTextlabel("tuitionLabel", "Tuition", 90, 68);
  tuitionLabel.setColorValue(color(255));
  tuitionLabel.setControlFont(sfont); 
  summerTuitionValue = controlP5.addTextlabel("summerTuitionValue", "", 0, 68);
  summerTuitionValue.setColorValue(color(255));
  summerTuitionValue.setControlFont(sfont);
  springTuitionValue = controlP5.addTextlabel("springTuitionValue", "", 0, 68);
  springTuitionValue.setColorValue(color(255));
  springTuitionValue.setControlFont(sfont);
  fallTuitionValue = controlP5.addTextlabel("fallTuitionValue", "", 0, 68);
  fallTuitionValue.setColorValue(color(255));
  fallTuitionValue.setControlFont(sfont);
  //books and supplies
  booksLabel = controlP5.addTextlabel("booksLabel", "Books & supplies", 70, 155 - 27);
  booksLabel.setColorValue(color(255));
  booksLabel.setControlFont(sfont);
  summerBooksValue = controlP5.addTextlabel("summerBooksValue", "", 0, 155 - 27);
  summerBooksValue.setColorValue(color(255));
  summerBooksValue.setControlFont(sfont);
  springBooksValue = controlP5.addTextlabel("springBooksValue", "", 0, 155 - 27);
  springBooksValue.setColorValue(color(255));
  springBooksValue.setControlFont(sfont);
  fallBooksValue = controlP5.addTextlabel("fallBooksValue", "", 0, 155 - 27);
  fallBooksValue.setColorValue(color(255));
  fallBooksValue.setControlFont(sfont);
  //student activities fee
  studentFeeLabel = controlP5.addTextlabel("studentFeeLabel", "Student fees", 70, 115 - 17);
  studentFeeLabel.setColorValue(color(255));
  studentFeeLabel.setControlFont(sfont);
  summerStudentFeeValue = controlP5.addTextlabel("summerStudentFeeValue", "", 0, 115 - 17);
  summerStudentFeeValue.setColorValue(color(255));
  summerStudentFeeValue.setControlFont(sfont);
  springStudentFeeValue = controlP5.addTextlabel("springStudentFeeValue", "", 0, 115 - 17);
  springStudentFeeValue.setColorValue(color(255));
  springStudentFeeValue.setControlFont(sfont);
  fallStudentFeeValue = controlP5.addTextlabel("fallStudentFeeValue", "", 0, 115 - 17);
  fallStudentFeeValue.setColorValue(color(255));
  fallStudentFeeValue.setControlFont(sfont);

  //educational subtotal of each semester
  educationalSubTotalLabel = controlP5.addTextlabel("educationalSubTotalLabel", "Education costs", 70, 360 - 202);
  educationalSubTotalLabel.setColorValue(color(155, 36, 46));
  educationalSubTotalLabel.setControlFont(sfont);
  summerEducationalSubTotalValue = controlP5.addTextlabel("summerEducationalSubTotalValue", "", 0, 360 - 202);
  summerEducationalSubTotalValue.setColorValue(color(155, 36, 46));
  summerEducationalSubTotalValue.setControlFont(sfont);
  springEducationalSubTotalValue = controlP5.addTextlabel("springEducationalSubTotalValue", "", 0, 360 - 202);
  springEducationalSubTotalValue.setColorValue(color(155, 36, 46));
  springEducationalSubTotalValue.setControlFont(sfont);
  fallEducationalSubTotalValue = controlP5.addTextlabel("fallEducationalSubTotalValue", "", 0, 360 - 202);
  fallEducationalSubTotalValue.setColorValue(color(155, 36, 46));
  fallEducationalSubTotalValue.setControlFont(sfont);  

  //additional expenses subtotal of each semester 
  AddExpensesSubTotalLabel = controlP5.addTextlabel("AddExpensesSubTotalLabel", "Living costs***", 70, 600 - 292);
  AddExpensesSubTotalLabel.setColorValue(color(155, 36, 46));
  AddExpensesSubTotalLabel.setControlFont(sfont);
  summerAddExpensesSubTotalValue = controlP5.addTextlabel("summerAddExpensesSubTotalValue", "", 0, 600 - 292);
  summerAddExpensesSubTotalValue.setColorValue(color(155, 36, 46));
  summerAddExpensesSubTotalValue.setControlFont(sfont);
  springAddExpensesSubTotalValue = controlP5.addTextlabel("springAddExpensesSubTotalValue", "", 0, 600 - 292);
  springAddExpensesSubTotalValue.setColorValue(color(155, 36, 46));
  springAddExpensesSubTotalValue.setControlFont(sfont);
  fallAddExpensesSubTotalValue = controlP5.addTextlabel("fallAddExpensesSubTotalValue", "", 0, 600 - 292);
  fallAddExpensesSubTotalValue.setColorValue(color(155, 36, 46));
  fallAddExpensesSubTotalValue.setControlFont(sfont);  

  //total costs for each semester
  semesterTotalLabel = controlP5.addTextlabel("semesterTotalLabel", "Estimated total costs", 70, 660 - 307);
  semesterTotalLabel.setColorValue(color(155, 36, 46));
  semesterTotalLabel.setControlFont(sfont);
  summerTotalValue = controlP5.addTextlabel("summerTotalValue", "", 0, 660 - 307);
  summerTotalValue.setColorValue(color(155, 36, 46));
  summerTotalValue.setControlFont(sfont);
  springTotalValue = controlP5.addTextlabel("springTotalValue", "", 0, 660 - 307);
  springTotalValue.setColorValue(color(155, 36, 46));
  springTotalValue.setControlFont(sfont);
  fallTotalValue = controlP5.addTextlabel("fallTotalValue", "", 0, 660 - 307);
  fallTotalValue.setColorValue(color(155, 36, 46));
  fallTotalValue.setControlFont(sfont);  

  //housing costs
  housingLabel = controlP5.addTextlabel("housingLabel", "Campus Residence", 70, 400 - 212);
  housingLabel.setColorValue(color(255));
  housingLabel.setControlFont(sfont);
  summerHousingValue = controlP5.addTextlabel("summerHousingValue", "", 0, 400 - 212);
  summerHousingValue.setColorValue(color(255));
  summerHousingValue.setControlFont(sfont);
  springHousingValue = controlP5.addTextlabel("springHousingValue", "", 0, 400 - 212);
  springHousingValue.setColorValue(color(255));
  springHousingValue.setControlFont(sfont);
  fallHousingValue = controlP5.addTextlabel("fallHousingValue", "", 0, 400 - 212);
  fallHousingValue.setColorValue(color(255));
  fallHousingValue.setControlFont(sfont);  

  //health and dental plan costs for each semester
  healthPlanLabel = controlP5.addTextlabel("healthPlanLabel", "SFSS Health & Dental plan*", 70, 315 - 97);
  healthPlanLabel.setColorValue(color(255));
  healthPlanLabel.setControlFont(sfont);
  summerHealthValue = controlP5.addTextlabel("summerHealthValue", "", 0, 315 - 97);
  summerHealthValue.setColorValue(color(255));
  summerHealthValue.setControlFont(sfont);
  springHealthValue = controlP5.addTextlabel("springHealthValue", "", 0, 315 - 97);
  springHealthValue.setColorValue(color(255));
  springHealthValue.setControlFont(sfont);
  fallHealthValue = controlP5.addTextlabel("fallHealthValue", "", 0, 315 - 97);
  fallHealthValue.setColorValue(color(255));
  fallHealthValue.setControlFont(sfont);

  //medical services plan of BC fee
  mspLabel = controlP5.addTextlabel("mspLabel", "BC Medical Services Plan**", 70, 520 - 272);
  mspLabel.setColorValue(color(255));
  mspLabel.setControlFont(sfont);
  summerMSPValue = controlP5.addTextlabel("summerMSPValue", "", 0, 520 - 272);
  summerMSPValue.setColorValue(color(255));
  summerMSPValue.setControlFont(sfont);
  springMSPValue = controlP5.addTextlabel("springMSPValue", "", 0, 520 - 272);
  springMSPValue.setColorValue(color(255));
  springMSPValue.setControlFont(sfont);
  fallMSPValue = controlP5.addTextlabel("fallMSPValue", "", 0, 520 - 272);
  fallMSPValue.setColorValue(color(255));
  fallMSPValue.setControlFont(sfont);

  //miscellaneous costs
  miscellaneousLabel = controlP5.addTextlabel("miscellaneousLabel", "Food", 70, 560 - 282);
  miscellaneousLabel.setColorValue(color(255));
  miscellaneousLabel.setControlFont(sfont);
  summerMiscellaneousValue = controlP5.addTextlabel("summerMiscellaneousValue", "", 0, 560 - 282);
  summerMiscellaneousValue.setColorValue(color(255));
  summerMiscellaneousValue.setControlFont(sfont);
  springMiscellaneousValue = controlP5.addTextlabel("springMiscellaneousValue", "", 0, 560 - 282);
  springMiscellaneousValue.setColorValue(color(255));
  springMiscellaneousValue.setControlFont(sfont);
  fallMiscellaneousValue = controlP5.addTextlabel("fallMiscellaneousValue", "", 0, 560 - 282);
  fallMiscellaneousValue.setColorValue(color(255));
  fallMiscellaneousValue.setControlFont(sfont);

  //grand total
  grandTotalLabel = controlP5.addTextlabel("grandTotalLabel", "Estimated annual total expenses:", 70, 445);
  grandTotalLabel.setColorValue(color(255));
  grandTotalLabel.setControlFont(qfont);
  grandTotalValue = controlP5.addTextlabel("grandTotalValue", "", 0, 445);
  grandTotalValue.setColorValue(color(255));
  grandTotalValue.setControlFont(qfont);


  //domestic student engineering premium fee
  domesticEngineeringSciLabel = controlP5.addTextlabel("domesticEngineeringSciLabel", "200/300/400 division courses in the School of Engineering Science:$184 (premium/unit)", 10, 400);
  //domestic student comupter science premium fee
  domesticComputingSciLabel = controlP5.addTextlabel("domesticComputingSciLabel", "200/300/400 division courses in the School of Computing Science:$176 (premium/unit)", 70, 415);
  //domestic business premium fee
  domesticBusinessAdminLabel = controlP5.addTextlabel("domesticBusinessAdminLabel", "200/300/400 division courses in the Faculty of Business Administration:$223 (premium/unit)", 70, 400);
  //international student engineering premium fee
  interEngineeringSciLabel = controlP5.addTextlabel("interEngineeringSciLabel", "200/300/400 division courses in the School of Engineering Science:$558 (premium/unit)", 70, 415);
  //international student comupter science premium fee
  interComputingSciLabel = controlP5.addTextlabel("interComputingSciLabel", "200/300/400 division courses in the School of Computing Science:$550 (premium/unit)", 70, 400);
  //international business premium fee
  interBusinessAdminLabel = controlP5.addTextlabel("interBusinessAdminLabel", "200/300/400 division courses in the Faculty of Business Administration:$597 (premium/unit)", 70, 415);

  noteHealthDental = controlP5.addTextlabel("noteHealthDental", "*SFSS Health and Dental plan fees are paid at one time for 12 months coverage (Sep-Aug)", 10, 500);
  noteHealthDental2 = controlP5.addTextlabel("noteHealthDental2", "for students starting in Fall or 8 months coverage (Jan-Apr) for students starting in Spring.", 10, 512);
  
  noteMSP = controlP5.addTextlabel("noteMSP", "**The Medical Services Plan, MSP is paid directly to the government but is included", 10, 527);
  noteMSP2 = controlP5.addTextlabel("noteMSP2", "here as a cost incurred to the student in a given term.", 10, 542);
  noteLivingCosts = controlP5.addTextlabel("noteLivingCosts", "***Living costs may vary based on lifestyle. Personal expenses are not included in", 10, 557);
  noteLivingCosts2 = controlP5.addTextlabel("noteLivingCosts2", "these estimates and would therefore impact overall costs.", 10, 569);

  fallSem = controlP5.addTextlabel("fallSem", "Fall Term", 260, 10);
  fallSem.setColorValue(color(255));
  fallSem.setControlFont(sfont);
  fallUnitsValue = controlP5.addTextlabel("fallUnitsValue", "", 260, 35);
  fallUnitsValue.setColorValue(color(255));
  fallUnitsValue.setControlFont(pfont);  
  springSem = controlP5.addTextlabel("springSem", "Spring Term", 440, 10);
  springSem.setColorValue(color(255));
  springSem.setControlFont(sfont);
  springUnitsValue = controlP5.addTextlabel("springUnitsValue", "", 440, 35);
  springUnitsValue.setColorValue(color(255));
  springUnitsValue.setControlFont(pfont); 
  summerSem = controlP5.addTextlabel("summerSem", "Summer Term", 620, 10);
  summerSem.setColorValue(color(255));
  summerSem.setControlFont(sfont);
  summerUnitsValue = controlP5.addTextlabel("summerUnitsValue", "", 620, 35);
  summerUnitsValue.setColorValue(color(255));
  summerUnitsValue.setControlFont(pfont); 

  facultyValue = controlP5.addTextlabel("facultyValue", "", 20, 30);
  facultyValue.setColorValue(color(0));
  facultyValue.setControlFont(pfont);
  typeStudentValue = controlP5.addTextlabel("typeStudentValue", "", 20, 10);
  typeStudentValue.setColorValue(color(155, 36, 46));
  typeStudentValue.setControlFont(pfont);

  errorMessage = controlP5.addTextlabel("errorMessage", "", 20, 240);
  errorMessage.setColorValue(color(0));
  errorMessage.setControlFont(qfont);
}


public void customize(DropdownList ddl) {
  ddl.setBackgroundColor(color(155, 36, 46));
  ddl.setItemHeight(20);
  ddl.setBarHeight(20);
  ddl.captionLabel().set("0");
  ddl.captionLabel().style().marginTop = 3;  
  ddl.captionLabel().style().marginLeft = 5;
  ddl.valueLabel().style().marginLeft = 5;
  ddl.addItem("Co-op", 99);
  for (int i=0;i<23;i++) {
    ddl.addItem(""+i, i);
  }

  ddl.setColorBackground(color(73, 72, 64));
  ddl.setColorActive(color(155, 36, 46));
}



void controlEvent(ControlEvent theEvent) {

  if (theEvent.isController())
  {
    //canadian student
    if (theEvent.controller().name()=="Yes, I am a Canadian student.") {  

      if (theEvent.controller().value()==1) 
      {
        TrueCanadianStudent = true;
        cp5.controller("No, I am an international student.").setValue(0);
      }
      else if (theEvent.controller().value()==0) {
        TrueCanadianStudent = false;
      }
    }
    //international student
    if (theEvent.controller().name()=="No, I am an international student.") {  

      if (theEvent.controller().value()==1) 
      {
        TrueInternationalStudent = true;
        cp5.controller("Yes, I am a Canadian student.").setValue(0);
      }
      else if (theEvent.controller().value()==0) {
        TrueInternationalStudent = false;
      }
    } 
    if (theEvent.controller().name()=="Applied Sciences")
    {
      if (theEvent.controller().value()==1) 
      {
        TrueAppliedSciences = true;
        cp5.controller("Business Administration").setValue(0);
        cp5.controller("Arts and Social Science").setValue(0);
        cp5.controller("Communication, Art & Technology").setValue(0);
        cp5.controller("Education").setValue(0);
        cp5.controller("Environment").setValue(0);
        cp5.controller("Health Sciences").setValue(0);
        cp5.controller("Science").setValue(0);
      }
      else if (theEvent.controller().value()==0) {
        TrueAppliedSciences = false;
      }
    }
    if (theEvent.controller().name()=="Business Administration")
    {
      if (theEvent.controller().value()==1) 
      {
        TrueBusiness = true;
        cp5.controller("Applied Sciences").setValue(0);
        cp5.controller("Arts and Social Science").setValue(0);
        cp5.controller("Communication, Art & Technology").setValue(0);
        cp5.controller("Education").setValue(0);
        cp5.controller("Environment").setValue(0);
        cp5.controller("Health Sciences").setValue(0);
        cp5.controller("Science").setValue(0);
      }
      else if (theEvent.controller().value()==0) {
        TrueBusiness = false;
      }
    }
    if (theEvent.controller().name()=="Arts and Social Science")
    {
      if (theEvent.controller().value()==1) 
      {
        TrueArtsSocialSciences = true;
        cp5.controller("Applied Sciences").setValue(0);
        cp5.controller("Business Administration").setValue(0);
        cp5.controller("Communication, Art & Technology").setValue(0);
        cp5.controller("Education").setValue(0);
        cp5.controller("Environment").setValue(0);
        cp5.controller("Health Sciences").setValue(0);
        cp5.controller("Science").setValue(0);
      }
      else if (theEvent.controller().value()==0) {
        TrueArtsSocialSciences = false;
      }
    }
    if (theEvent.controller().name()=="Communication, Art & Technology")
    {
      if (theEvent.controller().value()==1) 
      {
        TrueCommunicationArtTech = true;
        cp5.controller("Applied Sciences").setValue(0);
        cp5.controller("Business Administration").setValue(0);
        cp5.controller("Arts and Social Science").setValue(0);
        cp5.controller("Education").setValue(0);
        cp5.controller("Environment").setValue(0);
        cp5.controller("Health Sciences").setValue(0);
        cp5.controller("Science").setValue(0);
      }
      else if (theEvent.controller().value()==0) {
        TrueCommunicationArtTech = false;
      }
    }
    if (theEvent.controller().name()=="Education")
    {
      if (theEvent.controller().value()==1) 
      {
        TrueEducation = true;
        cp5.controller("Applied Sciences").setValue(0);
        cp5.controller("Business Administration").setValue(0);
        cp5.controller("Arts and Social Science").setValue(0);
        cp5.controller("Communication, Art & Technology").setValue(0);
        cp5.controller("Environment").setValue(0);
        cp5.controller("Health Sciences").setValue(0);
        cp5.controller("Science").setValue(0);
      }
      else if (theEvent.controller().value()==0) {
        TrueEducation = false;
      }
    }
    if (theEvent.controller().name()=="Environment")
    {
      if (theEvent.controller().value()==1) 
      {
        TrueEnvironment = true;
        cp5.controller("Applied Sciences").setValue(0);
        cp5.controller("Business Administration").setValue(0);
        cp5.controller("Arts and Social Science").setValue(0);
        cp5.controller("Communication, Art & Technology").setValue(0);
        cp5.controller("Education").setValue(0);
        cp5.controller("Health Sciences").setValue(0);
        cp5.controller("Science").setValue(0);
      }
      else if (theEvent.controller().value()==0) {
        TrueEnvironment = false;
      }
    }
    if (theEvent.controller().name()=="Health Sciences")
    {
      if (theEvent.controller().value()==1) 
      {
        TrueHealthSciences = true;
        cp5.controller("Applied Sciences").setValue(0);
        cp5.controller("Business Administration").setValue(0);
        cp5.controller("Arts and Social Science").setValue(0);
        cp5.controller("Communication, Art & Technology").setValue(0);
        cp5.controller("Education").setValue(0);
        cp5.controller("Environment").setValue(0);
        cp5.controller("Science").setValue(0);
      }
      else if (theEvent.controller().value()==0) {
        TrueHealthSciences = false;
      }
    }
    if (theEvent.controller().name()=="Science")
    {
      if (theEvent.controller().value()==1) 
      {
        TrueScience = true;
        cp5.controller("Applied Sciences").setValue(0);
        cp5.controller("Business Administration").setValue(0);
        cp5.controller("Arts and Social Science").setValue(0);
        cp5.controller("Communication, Art & Technology").setValue(0);
        cp5.controller("Education").setValue(0);
        cp5.controller("Environment").setValue(0);
        cp5.controller("Health Sciences").setValue(0);
      }
      else if (theEvent.controller().value()==0) {
        TrueScience = false;
      }
    }

    //living on campus
    if (theEvent.controller().name()=="Campus Residence") {  

      if (theEvent.controller().value()==1) 
      {
        TrueHousing = true;
      }
      else if (theEvent.controller().value()==0) {
        TrueHousing = false;
      }
    }

    if (theEvent.controller().name()=="MSP Fee") {  

      if (theEvent.controller().value()==1) 
      {
        TrueMSP = true;
      }
      else if (theEvent.controller().value()==0) {
        TrueMSP = false;
      }
    }
    if (theEvent.controller().name()=="Miscellaneous Costs") {  

      if (theEvent.controller().value()==1) 
      {
        TrueMiscellaneous = true;
      }
      else if (theEvent.controller().value()==0) {
        TrueMiscellaneous = false;
      }
    }
    if (TrueHousing == true)
    {
      fallHousingCosts = housingCosts;
      summerHousingCosts = housingCosts;
      springHousingCosts = housingCosts;
    }
    if (TrueHousing == false)
    {
      fallHousingCosts = 0;
      summerHousingCosts = 0;
      springHousingCosts = 0;
    }   
    if (TrueMSP == true)
    {
      fallMSP = mspFee;
      summerMSP= mspFee;
      springMSP = mspFee;
    }
    if (TrueMSP == false)
    {
      fallMSP = 0;
      summerMSP= 0;
      springMSP = 0;
    }    
    if (TrueMiscellaneous == true)
    {
      fallMiscellaneous = miscellaneousCosts;
      summerMiscellaneous= miscellaneousCosts;
      springMiscellaneous = miscellaneousCosts;
    }
    if (TrueMiscellaneous == false)
    {
      fallMiscellaneous = 0;
      summerMiscellaneous= 0;
      springMiscellaneous = 0;
    }
  }

  if (theEvent.isGroup()) {

    //fall semester fee calculation
    if (theEvent.group().name() == "Fall Term")
    {
      fallUnitsHolder = (int) theEvent.group().value();
      if (theEvent.group().value() == 99)
      {
        TrueFallCoop = true;
      }
      else
      {
        TrueFallCoop = false;
      }
    }
    //spring semester fee
    if (theEvent.group().name() == "Spring Term")
    {
      springUnitsHolder = (int) theEvent.group().value();
      if (theEvent.group().value() == 99)
      {
        TrueSpringCoop = true;
      }
      else
      {
        TrueSpringCoop = false;
      }
    }
    //summer semester
    if (theEvent.group().name() == "Summer Term")
    {
      summerUnitsHolder = (int) theEvent.group().value();
      if (theEvent.group().value() == 99)
      {
        TrueSummerCoop = true;
      }
      else
      {
        TrueSummerCoop = false;
      }
    }
  }
}


public void Estimate(int theValue) {

  chartOpen = !chartOpen;
  controlP5.controller("Estimate").setCaptionLabel((chartOpen==true) ? "Back":"Estimate");

  if (TrueCanadianStudent == false && TrueInternationalStudent == false)
  {
    //    chartOpen = false;
    controlP5.controller("Estimate").setCaptionLabel((chartOpen==true) ? "Back":"Estimate");
    errorMessage.setValue("Please answer question 1");
  }

  if (TrueAppliedSciences == false && TrueArtsSocialSciences == false && TrueBusiness == false && TrueCommunicationArtTech == false && TrueEducation == false && TrueEnvironment == false && TrueHealthSciences == false && TrueScience == false)
  {
    //    chartOpen = false;
    controlP5.controller("Estimate").setCaptionLabel((chartOpen==true) ? "Back":"Estimate");
    errorMessage.setValue("Please answer question 2");
  }

  if (TrueCanadianStudent == false && TrueInternationalStudent == false && TrueAppliedSciences == false && TrueArtsSocialSciences == false && TrueBusiness == false && TrueCommunicationArtTech == false && TrueEducation == false && TrueEnvironment == false && TrueHealthSciences == false && TrueScience == false)
  {
    //    chartOpen = false;
    controlP5.controller("Estimate").setCaptionLabel((chartOpen==true) ? "Back":"Estimate");
    errorMessage.setValue("Please answer question 1 and 2");
  }

  if ((TrueCanadianStudent == true || TrueInternationalStudent == true) && (TrueAppliedSciences == true || TrueArtsSocialSciences == true || TrueBusiness == true || TrueCommunicationArtTech == true || TrueEducation == true || TrueEnvironment == true || TrueHealthSciences == true || TrueScience == true))
  {
    //    chartOpen = false;
    controlP5.controller("Estimate").setCaptionLabel((chartOpen==true) ? "Back":"Estimate");
    errorMessage.setValue("");
  }

  summerTuitionValue.setValue("$"+summerTuition);
  springTuitionValue.setValue("$"+springTuition);
  fallTuitionValue.setValue("$"+fallTuition);
  summerBooksValue.setValue("$"+summerBooksTotal);
  springBooksValue.setValue("$"+springBooksTotal);
  fallBooksValue.setValue("$"+fallBooksTotal);
  summerStudentFeeValue.setValue("$"+summerStudentFee);
  springStudentFeeValue.setValue("$"+springStudentFee);
  fallStudentFeeValue.setValue("$"+fallStudentFee);
  summerHealthValue.setValue("$"+summerHealthCosts);
  springHealthValue.setValue("$"+springHealthCosts);
  fallHealthValue.setValue("$"+fallHealthCosts);
  summerEducationalSubTotalValue.setValue("$"+summerEducationalSubTotal);
  springEducationalSubTotalValue.setValue("$"+springEducationalSubTotal);
  fallEducationalSubTotalValue.setValue("$"+fallEducationalSubTotal);
  summerHousingValue.setValue("$"+summerHousingCosts);
  springHousingValue.setValue("$"+springHousingCosts); 
  fallHousingValue.setValue("$"+fallHousingCosts);
  summerMSPValue.setValue("$"+summerMSP);
  springMSPValue.setValue("$"+springMSP);
  fallMSPValue.setValue("$"+fallMSP);
  summerMiscellaneousValue.setValue("$"+summerMiscellaneous);
  springMiscellaneousValue.setValue("$"+springMiscellaneous);
  fallMiscellaneousValue.setValue("$"+fallMiscellaneous);
  summerAddExpensesSubTotalValue.setValue("$"+summerAddExpensesSubTotal);
  springAddExpensesSubTotalValue.setValue("$"+springAddExpensesSubTotal);
  fallAddExpensesSubTotalValue.setValue("$"+fallAddExpensesSubTotal);
  summerTotalValue.setValue("$"+summerTotal);
  springTotalValue.setValue("$"+springTotal);
  fallTotalValue.setValue("$"+fallTotal);

  grandTotalValue.setValue("$"+grandTotal);
  summerUnitsValue.setValue(summerUnits+" Units");
  springUnitsValue.setValue(springUnits+" Units");
  fallUnitsValue.setValue(fallUnits+" Units");


  if (TrueCanadianStudent == true)
  {
    typeStudentValue.setValue("Canadian Student/Permanent Resident");
  }
  if (TrueInternationalStudent == true)
  {
    typeStudentValue.setValue("International Student");
  }
  if (TrueAppliedSciences == true)
  {
    facultyValue.setValue("Applied Sciences");
  }
  if (TrueArtsSocialSciences == true)
  {
    facultyValue.setValue("Arts and Social Sciences");
  }
  if (TrueBusiness == true)
  {
    facultyValue.setValue("Business Administration");
  }
  if (TrueCommunicationArtTech == true)
  {
    facultyValue.setValue("Communication, Arts & Technology");
  }
  if (TrueEducation == true)
  {
    facultyValue.setValue("Education");
  }
  if (TrueEnvironment == true)
  {
    facultyValue.setValue("Environment");
  }
  if (TrueHealthSciences == true)
  {
    facultyValue.setValue("Health Sciences");
  }
  if (TrueScience == true)
  {
    facultyValue.setValue("Science");
  }
  if (TrueFallCoop == true)
  {
    fallUnitsValue.setValue("Co-op");
  }
  if (TrueSpringCoop == true)
  {
    springUnitsValue.setValue("Co-op");
  }
  if (TrueSummerCoop == true)
  {
    summerUnitsValue.setValue("Co-op");
  }
}

void draw() {

  background(255, 255, 255);

  domesticEngineeringSciLabel.hide();
  domesticComputingSciLabel.hide();
  interEngineeringSciLabel.hide();
  interComputingSciLabel.hide();
  domesticBusinessAdminLabel.hide();
  interBusinessAdminLabel.hide();


  //fall term fees calculation
  if (TrueInternationalStudent == true)
  {
    fallTuition = (int) (fallUnitsHolder * interTuitionPerUnit);
    fallUnits = (int) fallUnitsHolder;
    springTuition = (int) (springUnitsHolder * interTuitionPerUnit);
    springUnits = (int) springUnitsHolder;
    summerTuition = (int) (summerUnitsHolder * interTuitionPerUnit);
    summerUnits = (int) summerUnitsHolder;
  }
  if (TrueCanadianStudent == true)
  {
    fallTuition = (int) (fallUnitsHolder * domesticTuitionPerUnit);
    fallUnits = (int) fallUnitsHolder;
    springTuition = (int) (springUnitsHolder * domesticTuitionPerUnit);
    springUnits = (int) springUnitsHolder;
    summerTuition = (int) (summerUnitsHolder * domesticTuitionPerUnit);
    summerUnits = (int) summerUnitsHolder;
  }

  fallBooksTotal= (int) (fallUnitsHolder * ConbooksFee);
  springBooksTotal= (int) (springUnitsHolder * ConbooksFee);
  summerBooksTotal= (int) (summerUnitsHolder * ConbooksFee);

  if (fallUnitsHolder <= 3 && fallUnitsHolder > 0)
  {
    fallStudentActivityFee = studentActivityFee3units;
    fallRecreationFee = recreationFee3units;
    fallstudentServicesFee = ConstudentServicesFee;
    fallUpassFee = ConupassFee;
  }
  else if (fallUnitsHolder > 3)
  {
    fallStudentActivityFee = studentActivityFee4units;
    fallRecreationFee = recreationFee4units;
    fallstudentServicesFee = ConstudentServicesFee;
    fallUpassFee = ConupassFee;
  }
  else if (fallUnitsHolder == 0)
  {
    fallRecreationFee = 0;
    fallStudentActivityFee = 0;
    fallstudentServicesFee = 0;
    fallUpassFee = 0;
    fallMSP = 0;
    fallMiscellaneous = 0;
    fallHousingCosts = 0;
  }
  fallStudentFee = fallStudentActivityFee + fallRecreationFee + fallstudentServicesFee + fallUpassFee;

  //spring term fees calculation
  if (springUnitsHolder <= 3 && springUnitsHolder > 0)
  {
    springStudentFee = studentActivityFee3units;
    springRecreationFee = recreationFee3units;
    springstudentServicesFee = ConstudentServicesFee;
    springUpassFee = ConupassFee;
  }
  else if (springUnitsHolder > 3)
  {
    springStudentFee = studentActivityFee4units;
    springRecreationFee = recreationFee4units;
    springstudentServicesFee = ConstudentServicesFee;
    springUpassFee = ConupassFee;
  }
  else if (springUnitsHolder == 0)
  {
    springStudentFee = 0;
    springRecreationFee = 0;
    springstudentServicesFee = 0;
    springUpassFee = 0;
    springMSP = 0;
    springMiscellaneous = 0;
    springHousingCosts = 0;
  }
  springStudentFee = springStudentFee + springRecreationFee + springstudentServicesFee + springUpassFee;

  //summer term fees calculator
  if (summerUnitsHolder <= 3 && summerUnitsHolder > 0)
  {
    summerStudentActivityFee = studentActivityFee3units;
    summerRecreationFee = recreationFee3units;
    summerstudentServicesFee = ConstudentServicesFee;
    summerUpassFee = ConupassFee;
  }
  else if (summerUnitsHolder > 3)
  {
    summerStudentActivityFee = studentActivityFee4units;
    summerRecreationFee = recreationFee4units;
    summerstudentServicesFee = ConstudentServicesFee;
    summerUpassFee = ConupassFee;
  }
  else if (summerUnitsHolder == 0)
  {
    summerStudentActivityFee = 0;
    summerRecreationFee = 0;
    summerstudentServicesFee = 0;
    summerUpassFee = 0;
    summerMSP = 0;
    summerMiscellaneous = 0;
    summerHousingCosts = 0;
  }

  summerStudentFee = summerStudentActivityFee + summerRecreationFee + summerstudentServicesFee + summerUpassFee;


  if (TrueAppliedSciences == true && TrueCanadianStudent == true)
  {
    domesticEngineeringSciLabel.show();
    domesticComputingSciLabel.show();
    interEngineeringSciLabel.hide();
    interComputingSciLabel.hide();
  }
  else if (TrueAppliedSciences == false && TrueCanadianStudent == true)
  {
    domesticEngineeringSciLabel.hide();
    domesticComputingSciLabel.hide();
    interEngineeringSciLabel.hide();
    interComputingSciLabel.hide();
  }
  if (TrueBusiness == true && TrueCanadianStudent == true)
  {
    domesticBusinessAdminLabel.show();
    interBusinessAdminLabel.hide();
  }
  else if (TrueBusiness == false)
  {
    domesticBusinessAdminLabel.hide();
  }
  if (TrueAppliedSciences == true && TrueInternationalStudent == true)
  {
    interEngineeringSciLabel.show();
    interComputingSciLabel.show();
    domesticEngineeringSciLabel.hide();
    domesticComputingSciLabel.hide();
  }
  else if (TrueAppliedSciences == false)
  {
    interEngineeringSciLabel.hide();
    interComputingSciLabel.hide();
  }

  if (TrueBusiness == true && TrueInternationalStudent == true)
  {
    interBusinessAdminLabel.show();
    domesticBusinessAdminLabel.hide();
  }
  else if (TrueBusiness == false)
  {
    interBusinessAdminLabel.hide();
  }
  if (fallUnitsHolder > 0)
  {
    fallHealthCosts = 198;
    springHealthCosts = 0;
    summerHealthCosts = 0;
  }
  if (fallUnitsHolder == 0 && springUnitsHolder > 0)
  {
    fallHealthCosts = 0;
    springHealthCosts = 132;
    summerHealthCosts = 0;
  }
  if (fallUnitsHolder == 0 && springUnitsHolder == 0 && summerUnitsHolder > 0)
  {
    fallHealthCosts = 0;
    springHealthCosts = 0;
    summerHealthCosts = 0;
  }

  if (TrueFallCoop == true)
  {
    fallTuition = coopFees;
    fallBooksTotal = 0;
    fallStudentFee = coopStudentActivityFee + ConupassFee;
  }
  if (TrueSpringCoop == true)
  {
    springTuition = coopFees;
    springBooksTotal = 0;
    springStudentFee = coopStudentActivityFee + ConupassFee;
  }
  if (TrueSummerCoop == true)
  {
    summerTuition = coopFees;
    summerBooksTotal = 0;
    summerStudentFee = coopStudentActivityFee + ConupassFee;
  }

  float changeX;
  float resultX = 100;

  changeX = tuitionLabel.position().x - 10;

  fill(50);
  rect(changeX - 15, 0, 800, 700);
  fill(color(255, 255, 255));
  rect(changeX - 15, -1, 260, 60);
  rect(changeX - 15, 345 - 195, 700, 30); //rect(changeX - 15, 345 - 195, 260, 30);
  rect(changeX - 15, 585 - 285, 700, 30);
  rect(changeX - 15, 645 - 300, 700, 30);
  fill(50);
  stroke(255);
  strokeWeight(3);
  //vertical lines
  line(changeX + 245, 0, changeX + 245, 375); //235
  line(changeX + 450 - resultX, 0, changeX + 450 - resultX, 375); //415
  line(changeX + 552 - resultX, 0, changeX + 552 - resultX, 375);
  //horizontal lines
  line(changeX - 15, 60, changeX + 800, 60);
  strokeWeight(1);
  line(changeX - 15, 100 - 10, changeX + 800, 100 - 10);
  line(changeX - 15, 140 - 20, changeX + 800, 140 - 20);
  line(changeX - 15, 180 - 30, changeX + 800, 180 - 30);
  line(changeX - 15, 220 - 40, changeX + 800, 220 - 40);
  line(changeX - 15, 260 - 50, changeX + 800, 260 - 50);
  line(changeX - 15, 305 - 65, changeX + 800, 305 - 65);
  line(changeX - 15, 385 - 115, changeX + 800, 385 - 115);  
  line(changeX - 15, 425 - 95, changeX + 800, 425 - 95);

  strokeWeight(3);
  line(changeX - 15, 345 - 195, changeX + 800, 345 - 195);  
  line(changeX - 15, 385 - 205, changeX + 800, 385 - 205);  
  line(changeX - 15, 585 - 285, changeX + 800, 585 - 285);
  line(changeX - 15, 625 - 295, changeX + 800, 625 - 295);
  line(changeX - 15, 645 - 300, changeX + 800, 645 - 300);
  line(changeX - 15, 685 - 310, changeX + 800, 685 - 310);

  summerEducationalSubTotal = summerTuition + summerBooksTotal + summerStudentFee; 
  springEducationalSubTotal = springTuition + springBooksTotal + springStudentFee;
  fallEducationalSubTotal = fallTuition + fallBooksTotal + fallStudentFee;

  summerAddExpensesSubTotal = summerHousingCosts +  summerMSP + summerMiscellaneous + summerHealthCosts;
  springAddExpensesSubTotal = springHousingCosts +  springMSP + springMiscellaneous + springHealthCosts;
  fallAddExpensesSubTotal = fallHousingCosts + fallMSP + fallMiscellaneous + fallHealthCosts;

  summerTotal = summerEducationalSubTotal + summerAddExpensesSubTotal;
  springTotal = springEducationalSubTotal + springAddExpensesSubTotal;
  fallTotal = fallEducationalSubTotal + fallAddExpensesSubTotal;

  grandTotal = summerTotal + fallTotal + springTotal;

  tuitionLabel.position().x += ((chartOpen==true ? 0:-1000) - tuitionLabel.position().x + 10) * 0.2;
  summerTuitionValue.position().x += ((chartOpen==true ? 0:-1000) - summerTuitionValue.position().x + 570 - 110) * 0.2;
  springTuitionValue.position().x += ((chartOpen==true ? 0:-1000) - springTuitionValue.position().x + 415 - 57) * 0.2;
  fallTuitionValue.position().x += ((chartOpen==true ? 0:-1000) - fallTuitionValue.position().x + 260 - 7) * 0.2;

  booksLabel.position().x += ((chartOpen==true ? 0:-1000) - booksLabel.position().x + 10) * 0.2;
  summerBooksValue.position().x += ((chartOpen==true ? 0:-1000) - summerBooksValue.position().x + 570 - 110) * 0.2;
  springBooksValue.position().x += ((chartOpen==true ? 0:-1000) - springBooksValue.position().x + 415 - 57) * 0.2;
  fallBooksValue.position().x += ((chartOpen==true ? 0:-1000) - fallBooksValue.position().x + 260 - 7) * 0.2;

  studentFeeLabel.position().x += ((chartOpen==true ? 0:-1000) - studentFeeLabel.position().x + 10) * 0.2;
  summerStudentFeeValue.position().x += ((chartOpen==true ? 0:-1000) - summerStudentFeeValue.position().x + 570 - 110) * 0.2;
  springStudentFeeValue.position().x += ((chartOpen==true ? 0:-1000) - springStudentFeeValue.position().x + 415 - 57) * 0.2;
  fallStudentFeeValue.position().x += ((chartOpen==true ? 0:-1000) - fallStudentFeeValue.position().x + 260 - 7) * 0.2;

  healthPlanLabel.position().x += ((chartOpen==true ? 0:-1000) -  healthPlanLabel.position().x + 10) * 0.2;
  summerHealthValue.position().x += ((chartOpen==true ? 0:-1000) -  summerHealthValue.position().x + 570 - 110) * 0.2;
  springHealthValue.position().x += ((chartOpen==true ? 0:-1000) -  springHealthValue.position().x + 415 - 57) * 0.2;
  fallHealthValue.position().x += ((chartOpen==true ? 0:-1000) -  fallHealthValue.position().x + 260 - 7) * 0.2;

  housingLabel.position().x += ((chartOpen==true ? 0:-1000) - housingLabel.position().x + 10) * 0.2;
  fallHousingValue.position().x += ((chartOpen==true ? 0:-1000) - fallHousingValue.position().x + 260 - 7) * 0.2;
  summerHousingValue.position().x += ((chartOpen==true ? 0:-1000) - summerHousingValue.position().x + 570 - 110) * 0.2;
  springHousingValue.position().x += ((chartOpen==true ? 0:-1000) - springHousingValue.position().x + 415 - 57) * 0.2;

  mspLabel.position().x += ((chartOpen==true ? 0:-1000) - mspLabel.position().x + 10) * 0.2;
  fallMSPValue.position().x += ((chartOpen==true ? 0:-1000) - fallMSPValue.position().x + 260 - 7) * 0.2;
  summerMSPValue.position().x += ((chartOpen==true ? 0:-1000) - summerMSPValue.position().x + 570 - 110) * 0.2;
  springMSPValue.position().x += ((chartOpen==true ? 0:-1000) - springMSPValue.position().x + 415 - 57) * 0.2;  

  miscellaneousLabel.position().x += ((chartOpen==true ? 0:-1000) - miscellaneousLabel.position().x + 10) * 0.2;
  fallMiscellaneousValue.position().x += ((chartOpen==true ? 0:-1000) - fallMiscellaneousValue.position().x + 260 - 7) * 0.2;
  summerMiscellaneousValue.position().x += ((chartOpen==true ? 0:-1000) - summerMiscellaneousValue.position().x + 570 - 110) * 0.2;
  springMiscellaneousValue.position().x += ((chartOpen==true ? 0:-1000) - springMiscellaneousValue.position().x + 415 - 57) * 0.2;

  educationalSubTotalLabel.position().x += ((chartOpen==true ? 0:-1000) - educationalSubTotalLabel.position().x + 10) * 0.2;
  fallEducationalSubTotalValue.position().x += ((chartOpen==true ? 0:-1000) - fallEducationalSubTotalValue.position().x + 260 - 7) * 0.2;
  summerEducationalSubTotalValue.position().x += ((chartOpen==true ? 0:-1000) - summerEducationalSubTotalValue.position().x + 570 - 110) * 0.2;
  springEducationalSubTotalValue.position().x += ((chartOpen==true ? 0:-1000) - springEducationalSubTotalValue.position().x + 415 - 57) * 0.2;

  AddExpensesSubTotalLabel.position().x += ((chartOpen==true ? 0:-1000) - AddExpensesSubTotalLabel.position().x + 10) * 0.2;
  fallAddExpensesSubTotalValue.position().x += ((chartOpen==true ? 0:-1000) - fallAddExpensesSubTotalValue.position().x + 260 - 7) * 0.2;
  summerAddExpensesSubTotalValue.position().x += ((chartOpen==true ? 0:-1000) - summerAddExpensesSubTotalValue.position().x + 570 - 110) * 0.2;
  springAddExpensesSubTotalValue.position().x += ((chartOpen==true ? 0:-1000) - springAddExpensesSubTotalValue.position().x + 415 - 57) * 0.2;

  semesterTotalLabel.position().x += ((chartOpen==true ? 0:-1000) - semesterTotalLabel.position().x + 10) * 0.2;
  fallTotalValue.position().x += ((chartOpen==true ? 0:-1000) - fallTotalValue.position().x + 260 - 7) * 0.2;
  summerTotalValue.position().x += ((chartOpen==true ? 0:-1000) - summerTotalValue.position().x + 570 - 110) * 0.2;
  springTotalValue.position().x += ((chartOpen==true ? 0:-1000) - springTotalValue.position().x + 415 - 57) * 0.2;

  grandTotalLabel.position().x += ((chartOpen==true ? 0:-1000) - grandTotalLabel.position().x + 10) * 0.2;
  grandTotalValue.position().x += ((chartOpen==true ? 0:-1000) - grandTotalValue.position().x + 280) * 0.2;

  domesticBusinessAdminLabel.position().x += ((chartOpen==true ? 0:-1000) - domesticBusinessAdminLabel.position().x+ 10) * 0.2;
  domesticComputingSciLabel.position().x += ((chartOpen==true ? 0:-1000) - domesticComputingSciLabel.position().x + 10) * 0.2;
  domesticEngineeringSciLabel.position().x += ((chartOpen==true ? 0:-1000) - domesticEngineeringSciLabel.position().x+ 10) * 0.2;

  interBusinessAdminLabel.position().x += ((chartOpen==true ? 0:-1000) - interBusinessAdminLabel.position().x+ 10) * 0.2;
  interComputingSciLabel.position().x += ((chartOpen==true ? 0:-1000) - interComputingSciLabel.position().x + 10) * 0.2;
  interEngineeringSciLabel.position().x += ((chartOpen==true ? 0:-1000) - interEngineeringSciLabel.position().x + 10) * 0.2;

  fallSem.position().x += ((chartOpen==true ? 0:-1000) - fallSem.position().x + 260 - 7) * 0.2;
  springSem.position().x += ((chartOpen==true ? 0:-1000) - springSem.position().x + 415 - 58) * 0.2;
  summerSem.position().x += ((chartOpen==true ? 0:-1000) - summerSem.position().x + 570 - 111) * 0.2;

  noteHealthDental.position().x += ((chartOpen==true ? 0:-1000) - noteHealthDental.position().x+ 10) * 0.2;
  noteHealthDental2.position().x += ((chartOpen==true ? 0:-1000) - noteHealthDental2.position().x+ 15) * 0.2;
  noteMSP.position().x += ((chartOpen==true ? 0:-1000) - noteMSP.position().x + 10) * 0.2;
  noteMSP2.position().x += ((chartOpen==true ? 0:-1000) - noteMSP2.position().x + 20) * 0.2;
  noteLivingCosts.position().x += ((chartOpen==true ? 0:-1000) - noteLivingCosts.position().x+ 10) * 0.2;
  noteLivingCosts2.position().x += ((chartOpen==true ? 0:-1000) - noteLivingCosts2.position().x+ 25) * 0.2;

  summerUnitsValue.position().x += ((chartOpen==true ? 0:-1000) - summerUnitsValue.position().x + 570 - 110) * 0.2;
  springUnitsValue.position().x += ((chartOpen==true ? 0:-1000) - springUnitsValue.position().x + 415 - 57) * 0.2;
  fallUnitsValue.position().x += ((chartOpen==true ? 0:-1000) - fallUnitsValue.position().x + 260 - 7) * 0.2;

  typeStudentValue.position().x += ((chartOpen==true ? 0:-1000) - typeStudentValue.position().x + 10) * 0.2;
  facultyValue.position().x += ((chartOpen==true ? 0:-1000) - facultyValue.position().x + 10) * 0.2;

  errorMessage.position().x += ((chartOpen==true ? 0:-1000) - errorMessage.position().x + 220) * 0.2;

  if (chartOpen == true && TrueCanadianStudent == false && TrueInternationalStudent == false)
  {
    fill(255);
    rect(180, 200, 330, 100);
  }
  if (chartOpen == true && TrueAppliedSciences == false && TrueArtsSocialSciences == false && TrueBusiness == false && TrueCommunicationArtTech == false && TrueEducation == false && TrueEnvironment == false && TrueHealthSciences == false && TrueScience == false)
  {
    fill(255);
    rect(180, 200, 330, 100);
  }

  if (chartOpen)
  {
    fill(255);
    strokeWeight(1);
    stroke(color(73, 72, 64));
    rect(495 - 100, 586, 109, 58);

    canadianCheckText.hide();
    internationalCheckText.hide();
    appliedSciencesCheckText.hide();
    artsSocialSciencesCheckText.hide();
    businessAdministrationCheckText.hide();
    communicationArtTechnologyCheckText.hide();
    educationCheckText.hide();
    environmentCheckText.hide();
    healthSciencesCheckText.hide();
    scienceCheckText.hide();
    housingCostsCheckTextYes.hide();
    mspFeeCheckTextYes.hide();
    miscellaneousCostsCheckTextYes.hide();
    immigration.hide();
    program.hide();
    units.hide();
    fall.hide();
    summer.hide();
    spring.hide();
    p1.hide();
    p2.hide();
    p3.hide();
    additionalExpenses.hide();
    cp5.hide();
    checkApply.hide();
    typicalCourseUnit.hide();
  }
  else
  {
    fill(255);
    strokeWeight(1);
    stroke(color(73, 72, 64));
    rect(495 - 100, 586, 109, 58); //495
    canadianCheckText.show();
    internationalCheckText.show();
    appliedSciencesCheckText.show();
    artsSocialSciencesCheckText.show();
    businessAdministrationCheckText.show();
    communicationArtTechnologyCheckText.show();
    educationCheckText.show();
    environmentCheckText.show();
    healthSciencesCheckText.show();
    scienceCheckText.show();
    housingCostsCheckTextYes.show();
    mspFeeCheckTextYes.show();
    miscellaneousCostsCheckTextYes.show();
    immigration.show();
    program.show();
    units.show();
    fall.show();
    summer.show();
    spring.show();
    p1.show();
    p2.show();
    p3.show();
    additionalExpenses.show();
    cp5.show();
    checkApply.show();
    typicalCourseUnit.show();
  }
}



