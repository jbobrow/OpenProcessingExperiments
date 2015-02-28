
/**
 * Savings calculator
 * http://subpixels.com
 *
 * - Deposit savings at end of week and/or fortnightly.
 * - Calculate interest daily.
 * - Credit interest monthly (rounded to nearest cent).
 * - Deduct fees monthly and/or annually.
 *
 * Note: All years have only 28 days in February for simplicity.
 */

/**
 * 2009-09-23 v1.0 subpixel
 */

final int yearsOfSaving = 15;

final float openingBalance  = 0.00f;
final float savingsPW       = 0.00f;
final float savingsPF       = 500.00f;
final float interestRatePA  = 0.03f;
final float monthlyFee      = 6.00f;
final float annualFee       = 0.00f;


String[] dayNames = { "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun" };

int[] monthDays = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
String[] monthNames = { "Jan", "Feb", "Mar", "Apr", "May", "Jun",
                        "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" };

final color Black   = #000000;
final color White   = #ffffff;
final color Grey100 = #646464;

final color Red     = #ff0000;
final color Green   = #00ff00;
final color Blue    = #0000ff;
final color Cyan    = #00ffff;
final color Magenta = #ff00ff;
final color Yellow  = #ffff00;

color dateFill = White;

color balanceFill = White;
float balanceRadius = 1;

color depositFill = Red;
float depositRadius = 5;

color accruedFill  = Yellow;
color interestFill = Yellow;
float interestRadius = 7;

color feesFill = Blue;
float feesRadius = 3;

color gridStroke = Grey100;

// Working values
float dailyInterestRate;

float balance;
float accruedInterest;
float totalDeposits;
float totalInterest;
float totalFees;

int dayNo;
int dayOfMonth;
int dayOfYear;
int monthIx;
int yearNo;

boolean paused;

// Display variable
float borderSpace;
float ox;
float oy;
float scaleX;
float scaleY;

final String  fontFace = "Ariel";
final float   fontSize = 13.0f;
final boolean fontSmoothing = true;
final float   lineHeight = 15.0f;

void setup()
{
  size(640, 640);
  smooth();
  frameRate(60);
  background(0);

  PFont labelFont = createFont(fontFace, fontSize, fontSmoothing);
  textFont(labelFont);

  borderSpace = 20.0f;
  
  ox = borderSpace;
  oy = height - borderSpace;
  
  scaleX = floor((width  - borderSpace - 5 - textWidth("$999999")) / 365.0f * 2.0f) / 2.0f;
  scaleY = (height - borderSpace * 2) / 250000.00f;

  println("scaleX: " + scaleX + ", scaleY: " + scaleY);
  
  dailyInterestRate = interestRatePA / 365.0f;
  
  // Draw grid
  stroke(gridStroke);
  
  float x1;
  float y1;
  float x2;
  float y2;
  
  x1 = ox;
  x2 = ox + 365 * scaleX;
  y1 = oy;
  for (int i = 0; ; i++)
  {
    y1 = oy - i * 50000.0f * scaleY;

    if (y1 < borderSpace) break;

    line(x1, y1, x2, y1);
  }

  y1 = borderSpace;
  y2 = oy;
  line (ox, y1, ox, y2);
  dayOfYear = 0;
  
  // Month labels
  fill(dateFill);
  for (int monthIx = 0; monthIx < 12; monthIx++)
  {
    dayOfYear += monthDays[monthIx];
    x1 = ox + dayOfYear * scaleX;
    line(x1, y1, x1, y2);
    
    text(monthNames[monthIx], x1 - (monthDays[monthIx] / 2) * scaleX - (textWidth(monthNames[monthIx]) / 2), oy + lineHeight);
  }

  dayNo      = 1;
  dayOfMonth = 1;
  dayOfYear  = 1;
  monthIx    = 0;
  yearNo     = 1;
  
  balance = openingBalance;
  
  paused = false;
}

void draw()
{
  if (yearNo > yearsOfSaving)
  {
    noLoop();
    return;
  }
  
  boolean depositToday = false;
  boolean creditToday = false;
  
  int dayOfWeekIx = (dayNo - 1) % 7;
  
  String dayStr  = "Y" + nf(yearNo, 2) + " D" + nf(dayOfYear, 3);
  String dateStr = dayNames[dayOfWeekIx] + " " + nf(dayOfMonth, 2) + " " + monthNames[monthIx];
  println("[" + dayStr + "] " + dateStr);

  // Deposit savings on last day of the week
  if (dayOfWeekIx == 6 && savingsPW > 0)
  {
    depositToday = true;
    
    balance       += savingsPW;
    totalDeposits += savingsPW;

    println("Deposit: " + savingsPW);
  }

  // Deposit savings on last day of the fortnight
  if ((dayNo % 14) == 0 && savingsPF > 0)
  {
    depositToday = true;
    
    balance       += savingsPF;
    totalDeposits += savingsPF;

    println("Deposit: " + savingsPF);
  }

  // Accrue daily interest
  float dailyInterest = balance * dailyInterestRate;
  accruedInterest += dailyInterest;
  
  println("Daily interest: " + dailyInterest + ", Total accrued: " + accruedInterest);
  
  // Credit interest and charge fees on last day of the month
  if (dayOfMonth == monthDays[monthIx])
  {
    creditToday = true;
    
    accruedInterest = round(accruedInterest * 100.0) / 100.0;
    
    balance       += accruedInterest;
    totalInterest += accruedInterest;
    
    println("Credit interest: " + accruedInterest);
    
    accruedInterest = 0.0f;

    // Monthly fee
    if (monthlyFee > 0)
    {
      balance   -= monthlyFee;
      totalFees += monthlyFee;
      println("Deduct monthly fee: " + monthlyFee);
    }
    
    // Annual fee
    if (monthIx == 11 && annualFee > 0)
    {
      balance   -= annualFee;
      totalFees += annualFee;
      println("Deduct annual fee: " + annualFee);
    }
  }
  
  String depositStr  = "Dep: $" + floor(totalDeposits);
  String interestStr = " Int: $" + floor(totalInterest);
  String feesStr     = " Fees: $" + floor(totalFees);
  String balanceStr  = " Bal: $" + floor(balance);
  String accruedStr  = " (Accr: $" + nf(accruedInterest, 1, 4) + ")";
  if (depositToday || creditToday)
  {
    println(depositStr + interestStr + feesStr + balanceStr + accruedStr);
  }
  
  // Display today's balance
  float x = ox + dayOfYear * scaleX;
  float y = oy - balance   * scaleY;
 
  noStroke();
  
  if (creditToday)
  {
    plot(x, y, interestRadius, interestFill);
  }

  if (depositToday)
  {
    plot(x, y, depositRadius, depositFill);
  }

  // Current balance
  plot(x, y, balanceRadius, balanceFill);

  // CURRENT TOTALS BAR
  noStroke();
  rectMode(CORNERS);
  
  // Total deposits
  fill(depositFill);
  y = oy - totalDeposits * scaleY;
  rect(ox - 15, oy, ox - 5, y);

  // Total interest
  fill(interestFill);
  float y2 = y - totalInterest * scaleY;
  rect(ox - 15, y2, ox - 5, y);
  
  // Total fees
  fill(feesFill);
  y = y2 + totalFees * scaleY;
  rect(ox - 10, y, ox - 5, y2);
  
  // CURRENT INFORMATION TEXT
  fill(Black);
  rect(0, 0, width - 1, borderSpace - 1);

  x = ox;
  y = lineHeight;

  x = incText(dayStr + " ", x, y, dateFill);
  x = incText(depositStr,   x, y, depositFill);
  x = incText(interestStr,  x, y, interestFill);
  x = incText(feesStr,      x, y, feesFill);
  x = incText(balanceStr,   x, y, balanceFill);
  x = incText(accruedStr,   x, y, accruedFill);
  
  fill(dateFill);
  text(dateStr, ox + 365 * scaleX - textWidth(dateStr), lineHeight);
  
  // Prepare for following day
  
  dayNo++;
  dayOfMonth++;
  dayOfYear++;
  
  // Move to next month?
  if (dayOfMonth > monthDays[monthIx])
  {
    monthIx++;
    dayOfMonth = 1;
    
    // Move to next year?
    if (monthIx >= monthDays.length)
    {
      fill(balanceFill);
      text("$" + floor(balance), ox + 365 * scaleX + 5, oy - balance * scaleY + 5);
      yearNo++;
      dayOfYear = 1;
      monthIx = 0;
    }
  }

  // End of saving period?
  if (yearNo > yearsOfSaving)
  {
    println("End of saving period");
    noLoop();  // Stop saving
  }
}

// Plot a point (filled circle) with nominated colour
void plot(float x, float y, float radius, color fillColor)
{
  fill(fillColor);
  ellipse(x, y, radius, radius);
}

// Display text in nominated colour and return x-position for following text
float incText(String s, float x, float y, color textFillColor)
{
  fill(textFillColor);
  text(s, x, y);
  return(x + textWidth(s));
}

// INTERACTIVE CONTROLS
void keyPressed()   { togglePaused(); }
void mousePressed() { togglePaused(); }

void togglePaused()
{
  paused = !paused;
  if (paused) noLoop(); else loop();
}


