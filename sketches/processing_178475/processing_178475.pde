
/* *
 * The program (ItCA project 3) draws a star over an image.
 *
 * MOUSE
 * (Only in the drawing mode)
 * pointer's X & Y coordinates : set the center of star and draw it
 * left button click           : set the main image to the image that is
 *                               anteceding circularly to the current one (i.e.,
 *                               in the counter-clockwise direction) and draw it
 * right button click          : set the main image to the image that is
 *                               following circularly to the current one (i.e.,
 *                               in the clockwise direction) and draw it
 * left button dragging        : set the star's points number to the points
 *                               number that is previous (linearly) to the
 *                               current one (i.e., in the leftward direction)
 *                               and draw the star
 * right button dragging       : set the star's points number to the points
 *                               number that is next (linearly) to the
 *                               current one (i.e., in the rightward direction)
 *                               and draw the star
 * (Only in the help mode)
 * middle button click         : (re)start to draw a star over an image with
 *                               the default drawing options
 * middle button dragging      : redo the last drawing if the drawing was
 *                               already done before
 *
 * KEYBOARD
 * (In both the drawing and help modes)
 * D                           : (re)start to draw a star over an image with
 *                               the default drawing options
 * R                           : redo the last drawing if the drawing was
 *                               already done before
 * (Only in the drawing mode)
 * A                           : set the image drawing dimensions' size option
 *                               to the drawing option that is anteceding
 *                               circularly to the current one (i.e., in the
 *                               counter-clockwise direction) and redraw the
 *                               image
 * F                           : set the image drawing dimensions' size option
 *                               to the drawing option that is following
 *                               circularly to the current one (i.e., in the
 *                               clockwise direction) and redraw the image
 * P                           : set the image drawing dimensions' size option
 *                               to the drawing option that is previous
 *                               (linearly) to the current one (i.e., in the
 *                               leftward direction) and redraw the image
 * N                           : set the image drawing dimensions' size option
 *                               to the drawing option that is next (linearly)
 *                               to the current one (i.e., in the rightward
 *                               direction) and redraw the image
 * H                           : show the help text
 * */

// Global constants and variables
          // quantity of all the 24-bits RGB colors
final int RGB_ALL_COLORS_QTY = 1 << 24;
final color RGB_FIRST_COLOR = #FFFFFF;
final color[] RGB_ALL_COLORS_PALETTE = new color[RGB_ALL_COLORS_QTY];
final int BACKGRND_COLOR_IDX = 0;
final byte DRAW_MODE_NUM = 1, // drawing mode
           HELP_MODE_NUM = 10; // help mode
final String IMG_FIL_NM_PREFIX = "src_img_",
             IMG_FIL_NM_SUFFIX = ".jpg";
final byte NO_IMG_FIL_IDX = -1,
           IMG_FIL_MIN_IDX = 1,
           IMG_FIL_MAX_IDX = 5,
           AFTER_DIFF_OF_IMG_FIL_LIMIT_IDXS
                = IMG_FIL_MAX_IDX - IMG_FIL_MIN_IDX + 1,
           NO_IMG_DIMS_SZ_OPTN = -1,
           IMG_DIMS_SZ_MIN_OPTN = 1,
           IMG_DIMS_SZ_MAX_OPTN = 6,
           IMG_DIMS_SZ_MAX_OPTN_MINUS_ONE
                = IMG_DIMS_SZ_MAX_OPTN - 1,
           AFTER_DIFF_OF_IMG_DIMS_SZ_LIMIT_OPTNS
                = IMG_DIMS_SZ_MAX_OPTN - IMG_DIMS_SZ_MIN_OPTN + 1,
           IMG_DIMS_ORIG_SZ_OPTN = IMG_DIMS_SZ_MIN_OPTN,
           IMG_FIXD_WIDTH_SZ_OPTN = IMG_DIMS_SZ_MAX_OPTN_MINUS_ONE,
           IMG_FIXD_HEIGHT_SZ_OPTN = IMG_DIMS_SZ_MAX_OPTN;
final int IMG_FIXD_WIDTH_SZ = 640,
          IMG_FIXD_HEIGHT_SZ = 480;
final color STAR_STROKE_COLOR = #000000,
            STAR_FILL_COLOR = 0x44FFFFFF;
final byte STAR_POINTS_MIN_NUM = 4,
           STAR_POINTS_MAX_NUM = 50,
           STAR_POINTS_INI_NUM = 10,
           AFTER_DIFF_OF_STAR_POINTS_LIMIT_NUMS
                = STAR_POINTS_MAX_NUM - STAR_POINTS_MIN_NUM + 1;
final int IMG_IN_STAR_BLURRING_WIDTH_SZ = 160;
final String DRAW_IMG_INFO_TXT_FNT_NM = "deja_vu_sans_mono.incomplete";
final String DRAW_TITLE_TXT_FNT_NM = "bandwidth_brk.incomplete";
final color DRAW_TITLE_TXT_COLOR = #448888;
final byte DRAW_TITLE_TXT_FNT_SZ = 50;
final color DRAW_IMG_INFO_TXT_COLOR = #0000FF;
final byte DRAW_IMG_INFO_TXT1_FNT_SZ = 18,
           DRAW_IMG_INFO_TXT2_FNT_SZ = 18;
final String HELP_TITLE_TXT_FNT_NM = "bandwidth_brk.incomplete";
final color HELP_TITLE_TXT_COLOR = #008800;
final byte HELP_TITLE_TXT_FNT_SZ = 50;
final String HELP_INSTRCTNS_STR_FL_NM = "basic_help.txt";
final String HELP_INSTRCTNS_TXT_FNT_NM = "deja_vu_sans_mono.incomplete";
final color HELP_INSTRCTNS_TXT_COLOR = #000000;
final byte HELP_INSTRCTNS_TXT_FNT_SZ = 18;
      // the current use mode number
byte useModeNum = HELP_MODE_NUM;
boolean updatesDrawing = false,
        updatesHelp = true;
byte imgFilIdx = NO_IMG_FIL_IDX,
     imgPrevFilIdx = NO_IMG_FIL_IDX;
String imgFilNm = null;
PImage img = null; // the main image
     /* positive values less than IMG_DIMS_SZ_MAX_OPTN as valid image size
        option values or NO_IMG_DIMS_SZ_OPTN for no image size option */
byte imgDimsSzOptnNum = NO_IMG_DIMS_SZ_OPTN,
     /* positive values less than IMG_DIMS_SZ_MAX_OPTN as valid image size
        option values or NO_IMG_DIMS_SZ_OPTN for no image option */
     imgDimsSzPrevOptn = NO_IMG_DIMS_SZ_OPTN;
byte starPointsNum = STAR_POINTS_INI_NUM;
int starCenterPosX, starCenterPosY,
    halfOfStarWidthSz, halfOfStarHeightSz,
    halfOfStarSmallestDimSz;
int imgDrawnWidthSz, imgDrawnHeightSz,
    imgDrawnFirstCrnrPosX, imgDrawnFirstCrnrPosY,
    imgDrawnFourthCrnrPosX, imgDrawnFourthCrnrPosY;
PFont drawTitleTxtFnt;
int drawTitleTxtPosX, drawTitleTxtPosY;
PFont drawImgInfoTxtFnt;
int drawImgInfoTxt1PosX, drawImgInfoTxt1PosY,
    drawImgInfoTxt2PosX, drawImgInfoTxt2PosY;
PFont helpTitleTxtFnt;
int helpTitleTxtPosX, helpTitleTxtPosY;
String helpInstrctnsStr = "";
PFont helpInstrctnsTxtFnt;
int helpInstrctnsTxtPosX, helpInstrctnsTxtPosY;

/*
 * Defines the initial enviroment properties and other necessary values.
 */
void setup() {

    size(1280, 720);

    for (int i = 0; i < RGB_ALL_COLORS_QTY; i++)
        RGB_ALL_COLORS_PALETTE[i] = RGB_FIRST_COLOR - (i << 8);

    starCenterPosX = width/2;
    starCenterPosY = height/2;

    /* The PFont object for the drawing's title text is assigned to a loaded
       external font. */
    drawTitleTxtFnt = loadFont(DRAW_TITLE_TXT_FNT_NM + ".vlw");
    drawTitleTxtPosX = width/2;
    drawTitleTxtPosY = 21*height/320;

    /* The PFont object for the image drawing's info text is assigned to a
       loaded external font. */
    drawImgInfoTxtFnt = loadFont(DRAW_IMG_INFO_TXT_FNT_NM + ".vlw");
    drawImgInfoTxt1PosX = width/2;
    drawImgInfoTxt1PosY = 301*height/320;
    drawImgInfoTxt2PosX = width/2;
    drawImgInfoTxt2PosY = 313*height/320;

    /* The PFont object for the help's title text is assigned to a loaded
       external font. */
    helpTitleTxtFnt = loadFont(HELP_TITLE_TXT_FNT_NM + ".vlw");
    helpTitleTxtPosX = width/2;
    helpTitleTxtPosY = 28*height/320;

    /* A new InputStream is initialized by opening the help instructions'
       file, which is in the 'data' folder. */
    BufferedReader reader = createReader(HELP_INSTRCTNS_STR_FL_NM); 
    String helpInpLineStr = "";

    do {
        helpInstrctnsStr += helpInpLineStr + '\n';
        try {
            helpInpLineStr = reader.readLine();
        }
        catch (IOException exc) {
            exc.printStackTrace();
            helpInpLineStr = null;
        }
    } while (helpInpLineStr != null);

    /* The PFont object for the image's instructions text is assigned to a
       loaded external font. */
    helpInstrctnsTxtFnt = loadFont(HELP_INSTRCTNS_TXT_FNT_NM + ".vlw");
    helpInstrctnsTxtPosX = 7*width/320;
    helpInstrctnsTxtPosY = 40*height/320;

}

/*
 * Executes the lines of code contained inside its block and related to the
 * interpretation of moved mouse's position.
 * Note: this function will be called whenever the mouse is moved and none of the
 *       mouse's buttons is pressed while the display windows (canvas) has the
 *       focus.
 */
void mouseMoved() {

    if (useModeNum == DRAW_MODE_NUM) {
        /* The movement is ignored if the mouse pointer is outside the drawn
           image. */
        if (imgDrawnFirstCrnrPosX < mouseX && mouseX < imgDrawnFourthCrnrPosX
            && imgDrawnFirstCrnrPosY < mouseY
            && mouseY < imgDrawnFourthCrnrPosY) {
            updatesDrawing = true;
        }
    }

}

/*
 * Executes the lines of code contained inside its block and related to the
 * interpretation of any mouse button being clicked (pressed and then released).
 * Note: this function will be called whenever any of the mouse's buttons is
 *       clicked while the display windows (canvas) has the focus.
 */
void mouseClicked() {

    switch (useModeNum) {

        case DRAW_MODE_NUM:
            if (mouseButton == LEFT)
                /* button for setting the anteceding image as the main image
                   while considering the images in a circular choice list and
                   drawing it */
                /* If 'IMG_FIL_MIN_IDX + 1 ≤ imgFilIdx ≤ IMG_FIL_MAX_IDX',
                   then 'IMG_FIL_MIN_IDX + 1 - IMG_FIL_MIN_IDX - 1 ≤ imgFilIdx
                   - IMG_FIL_MIN_IDX - 1 ≤ IMG_FIL_MAX_IDX - IMG_FIL_MIN_IDX
                   - 1' and therefore '0 ≤ imgFilIdx - IMG_FIL_MIN_IDX - 1
                   < IMG_FIL_MAX_IDX - IMG_FIL_MIN_IDX + 1' or '0 ≤ imgFilIdx
                   - IMG_FIL_MIN_IDX - 1 < AFTER_DIFF_OF_IMG_FIL_LIMIT_IDXS'.
                   Using the last relation, '(imgFilIdx - IMG_FIL_MIN_IDX - 1
                   + AFTER_DIFF_OF_IMG_FIL_LIMIT_IDXS)
                   %AFTER_DIFF_OF_IMG_FIL_LIMIT_IDXS + IMG_FIL_MIN_IDX'
                   is equal to 'imgFilIdx - IMG_FIL_MIN_IDX - 1
                   + IMG_FIL_MIN_IDX' and thus results in 'imgFilIdx - 1'. If
                   'imgFilIdx' is equal to 'IMG_FIL_MIN_IDX', then
                   '(imgFilIdx - IMG_FIL_MIN_IDX - 1
                   + AFTER_DIFF_OF_IMG_FIL_LIMIT_IDXS)
                   %AFTER_DIFF_OF_IMG_FIL_LIMIT_IDXS + IMG_FIL_MIN_IDX' is equal
                   to '(IMG_FIL_MIN_IDX - IMG_FIL_MIN_IDX - 1
                   + AFTER_DIFF_OF_IMG_FIL_LIMIT_IDXS)
                   %AFTER_DIFF_OF_IMG_FIL_LIMIT_IDXS + IMG_FIL_MIN_IDX', is
                   equal to '(AFTER_DIFF_OF_IMG_FIL_LIMIT_IDXS - 1)
                   %AFTER_DIFF_OF_IMG_FIL_LIMIT_IDXS + IMG_FIL_MIN_IDX', is
                   equal to 'AFTER_DIFF_OF_IMG_FIL_LIMIT_IDXS - 1
                   + IMG_FIL_MIN_IDX', is equal to 'IMG_FIL_MAX_IDX
                   - IMG_FIL_MIN_IDX + 1 - 1 + IMG_FIL_MIN_IDX' and
                   thus results in 'IMG_FIL_MAX_IDX'. */
                /* 'byte' function call is necessary due to the variable
                   type. */
                imgFilIdx = byte((imgFilIdx - IMG_FIL_MIN_IDX - 1
                                  + AFTER_DIFF_OF_IMG_FIL_LIMIT_IDXS)
                                 %AFTER_DIFF_OF_IMG_FIL_LIMIT_IDXS
                                 + IMG_FIL_MIN_IDX);
            else if (mouseButton == RIGHT)
                /* button for setting the following image as the main image
                   while considering the images in a circular choice list and
                   drawing it */
                /* If 'IMG_FIL_MIN_IDX ≤ imgFilIdx ≤ IMG_FIL_MAX_IDX - 1',
                   then 'IMG_FIL_MIN_IDX - IMG_FIL_MIN_IDX + 1 ≤ imgFilIdx
                   - IMG_FIL_MIN_IDX + 1 ≤ IMG_FIL_MAX_IDX - 1 - IMG_FIL_MIN_IDX
                   + 1' and therefore '1 ≤ imgFilIdx - IMG_FIL_MIN_IDX + 1
                   < IMG_FIL_MAX_IDX - IMG_FIL_MIN_IDX + 1' or '1 ≤ imgFilIdx
                   - IMG_FIL_MIN_IDX + 1 < AFTER_DIFF_OF_IMG_FIL_LIMIT_IDXS'.
                   Using the last relation, '(imgFilIdx - IMG_FIL_MIN_IDX
                   + 1)%AFTER_DIFF_OF_IMG_FIL_LIMIT_IDXS
                   + IMG_FIL_MIN_IDX' is equal to 'imgFilIdx - IMG_FIL_MIN_IDX
                   + 1 + IMG_FIL_MIN_IDX' and thus results in 'imgFilIdx + 1'.
                   If 'imgFilIdx' is equal to 'IMG_FIL_MAX_IDX', then
                   '(imgFilIdx - IMG_FIL_MIN_IDX + 1)
                   %AFTER_DIFF_OF_IMG_FIL_LIMIT_IDXS + IMG_FIL_MIN_IDX' is equal
                   to '(IMG_FIL_MAX_IDX - IMG_FIL_MIN_IDX + 1)
                   %AFTER_DIFF_OF_IMG_FIL_LIMIT_IDXS + IMG_FIL_MIN_IDX' or
                   'AFTER_DIFF_OF_IMG_FIL_LIMIT_IDXS
                   %AFTER_DIFF_OF_IMG_FIL_LIMIT_IDXS + IMG_FIL_MIN_IDX' and thus
                   results in 'IMG_FIL_MIN_IDX'. */
                /* 'byte' function call is necessary due to the variable
                   type. */
                imgFilIdx = byte((imgFilIdx - IMG_FIL_MIN_IDX + 1)
                                 %AFTER_DIFF_OF_IMG_FIL_LIMIT_IDXS
                                 + IMG_FIL_MIN_IDX);
            imgFilNm = IMG_FIL_NM_PREFIX + imgFilIdx + IMG_FIL_NM_SUFFIX;
            img = loadImage(imgFilNm);
            updatesDrawing = true;
            break;

        case HELP_MODE_NUM:
            if (mouseButton == CENTER)
                /* button for (re)starting the drawing the star over a image
                   with the default drawing options */
                startDrawing();
            break;

        default:

    }

}

/*
 * Executes the lines of code contained inside its block and related to the
 * interpretation of any dragged mouse button being pressed.
 * Note: this function will be called whenever the mouse is moved and any of the
 *       mouse's buttons is pressed while the display windows (canvas) has the
 *       focus.
 */
void mouseDragged() {

    switch (useModeNum) {

        case DRAW_MODE_NUM:
            /* The dragging is ignored if the mouse pointer is outside the drawn
               image. */
            if (imgDrawnFirstCrnrPosX < mouseX && mouseX < imgDrawnFourthCrnrPosX
                && imgDrawnFirstCrnrPosY < mouseY
                && mouseY < imgDrawnFourthCrnrPosY) {
                if (mouseButton == LEFT) {
                    if (keyPressed && key == CODED && keyCode == CONTROL)
                        /* pair of key & button for setting the anteceding
                           points' number as the star points' number while
                           considering the points' number in a circular choice
                           list and drawing the star */
                        /* If 'STAR_POINTS_MIN_NUM + 1 ≤ starPointsNum
                           ≤ STAR_POINTS_MAX_NUM', then 'STAR_POINTS_MIN_NUM + 1
                           - STAR_POINTS_MIN_NUM - 1 ≤ starPointsNum
                           - STAR_POINTS_MIN_NUM - 1 ≤ STAR_POINTS_MAX_NUM
                           - STAR_POINTS_MIN_NUM - 1' and hence '0
                           ≤ starPointsNum - STAR_POINTS_MIN_NUM - 1
                           - STAR_POINTS_MIN_NUM + 1' or '0 ≤ starPointsNum
                           - STAR_POINTS_MIN_NUM - 1
                           < AFTER_DIFF_OF_STAR_POINTS_LIMIT_NUMS'. Using the
                           last relation, '(starPointsNum - STAR_POINTS_MIN_NUM
                           - 1 + AFTER_DIFF_OF_STAR_POINTS_LIMIT_NUMS)
                           %AFTER_DIFF_OF_STAR_POINTS_LIMIT_NUMS
                           + STAR_POINTS_MIN_NUM' is equal to 'starPointsNum
                           - STAR_POINTS_MIN_NUM - 1 + STAR_POINTS_MIN_NUM' and
                           thus results in 'starPointsNum - 1'. If
                           'starPointsNum' is equal to 'STAR_POINTS_MIN_NUM',
                           then '(starPointsNum - STAR_POINTS_MIN_NUM - 1
                           + AFTER_DIFF_OF_STAR_POINTS_LIMIT_NUMS)
                           %AFTER_DIFF_OF_STAR_POINTS_LIMIT_NUMS
                           + STAR_POINTS_MIN_NUM' is equal to
                           '(STAR_POINTS_MIN_NUM - STAR_POINTS_MIN_NUM - 1
                           + AFTER_DIFF_OF_STAR_POINTS_LIMIT_NUMS)
                           %AFTER_DIFF_OF_STAR_POINTS_LIMIT_NUMS
                           + STAR_POINTS_MIN_NUM', is equal to
                           '(AFTER_DIFF_OF_STAR_POINTS_LIMIT_NUMS - 1)
                           %AFTER_DIFF_OF_STAR_POINTS_LIMIT_NUMS
                           + STAR_POINTS_MIN_NUM', is equal to
                           'AFTER_DIFF_OF_STAR_POINTS_LIMIT_NUMS - 1
                           + STAR_POINTS_MIN_NUM', is equal to
                           'STAR_POINTS_MAX_NUM - STAR_POINTS_MIN_NUM + 1 - 1
                           + STAR_POINTS_MIN_NUM' and thus results in
                           'STAR_POINTS_MAX_NUM'. */
                        /* 'byte' function call is necessary due to the variable
                           type. */
                        starPointsNum = byte((starPointsNum - STAR_POINTS_MIN_NUM
                                              - 1
                                              + AFTER_DIFF_OF_STAR_POINTS_LIMIT_NUMS)
                                             %AFTER_DIFF_OF_STAR_POINTS_LIMIT_NUMS
                                             + STAR_POINTS_MIN_NUM);
                    else
                        /* button for setting the previous points' number as
                           the star points' number while considering the points'
                           number in a linear choice list and drawing the star */
                        /* 'byte' function call is necessary due to the variable
                           type. */
                        starPointsNum = byte(constrain(--starPointsNum,
                                                          STAR_POINTS_MIN_NUM,
                                                          STAR_POINTS_MAX_NUM));
                }
                else if (mouseButton == RIGHT) {
                    if (keyPressed && key == CODED && keyCode == CONTROL)
                        /* pair of key & button for setting the following points'
                           number as the star points' number while considering
                           the points' number in a circular choice list and
                           drawing the star */
                        /* If 'STAR_POINTS_MIN_NUM ≤ starPointsNum
                           ≤ STAR_POINTS_MAX_NUM - 1', then 'STAR_POINTS_MIN_NUM
                           - STAR_POINTS_MIN_NUM + 1 ≤ starPointsNum
                           - STAR_POINTS_MIN_NUM + 1 ≤ STAR_POINTS_MAX_NUM - 1
                           - STAR_POINTS_MIN_NUM + 1' and hence '1
                           ≤ starPointsNum - STAR_POINTS_MIN_NUM + 1
                           < STAR_POINTS_MAX_NUM - STAR_POINTS_MIN_NUM + 1' or
                           '1 ≤ starPointsNum - STAR_POINTS_MIN_NUM + 1
                           < AFTER_DIFF_OF_STAR_POINTS_LIMIT_NUMS'. Using the
                           last relation, '(starPointsNum - STAR_POINTS_MIN_NUM
                           + 1) %AFTER_DIFF_OF_STAR_POINTS_LIMIT_NUMS
                           + STAR_POINTS_MIN_NUM' is equal to 'starPointsNum
                           - STAR_POINTS_MIN_NUM + 1 + STAR_POINTS_MIN_NUM' and
                           thus results in 'starPointsNum + 1'. If
                           'starPointsNum' is equal to 'STAR_POINTS_MAX_NUM',
                           then '(starPointsNum - STAR_POINTS_MIN_NUM + 1)
                           %AFTER_DIFF_OF_STAR_POINTS_LIMIT_NUMS
                           + STAR_POINTS_MIN_NUM' is equal to
                           '(STAR_POINTS_MAX_NUM - STAR_POINTS_MIN_NUM + 1)
                           %AFTER_DIFF_OF_STAR_POINTS_LIMIT_NUMS
                           + STAR_POINTS_MIN_NUM' or
                           'AFTER_DIFF_OF_STAR_POINTS_LIMIT_NUMS
                           %AFTER_DIFF_OF_STAR_POINTS_LIMIT_NUMS
                           + STAR_POINTS_MIN_NUM' and thus results in
                           'STAR_POINTS_MIN_NUM'. */
                        /* 'byte' function call is necessary due to the variable
                           type. */
                        starPointsNum = byte((starPointsNum - STAR_POINTS_MIN_NUM
                                              + 1)
                                             %AFTER_DIFF_OF_STAR_POINTS_LIMIT_NUMS
                                             + STAR_POINTS_MIN_NUM);
                    else
                        /* button for setting the next points' number as
                           the star points' number while considering the points'
                           number in a linear choice list and drawing the star */
                        /* 'byte' function call is necessary due to the variable
                           type. */
                        starPointsNum = byte(constrain(++starPointsNum,
                                                          STAR_POINTS_MIN_NUM,
                                                          STAR_POINTS_MAX_NUM));
                }
                updatesDrawing = true;
            }
            break;

        case HELP_MODE_NUM:
            if (mouseButton == CENTER)
                redoDrawing();
            break;

        default:

    }

}

/*
 * Executes the lines of code contained inside its block and related to the
 * interpretation of any keyboard key being pressed.
 * Note: this function will be called whenever any of the keyboard's keys is
 *       pressed while the display windows (canvas) has the focus.
 */
void keyPressed() {

    switch (Character.toUpperCase(key)) {

        case 'D':
            /* keys for (re)starting the drawing the star over a image with
               the default drawing options */

            startDrawing();
            break;

        case 'R':
            /* keys for redoing the last drawing if the drawing was already
               done */

            redoDrawing();
            break;

        case 'H': /* keys for showing the help text */

            setUseMode(HELP_MODE_NUM);
            break;

        default:

            if (useModeNum == DRAW_MODE_NUM) {

                switch (Character.toUpperCase(key)) {

                    case 'A':
                        /* keys for setting the anteceding dimensions' size
                           option (counter-clockwise direction) as the image
                           drawing dimensions' size option while considering
                           the options in a circular choice list and redrawing
                           the image */
                        /* If 'IMG_DIMS_SZ_MIN_OPTN + 1 ≤ imgDimsSzOptnNum
                           ≤ IMG_DIMS_SZ_MAX_OPTN', then 'IMG_DIMS_SZ_MIN_OPTN
                           + 1 - IMG_DIMS_SZ_MIN_OPTN - 1 ≤ imgDimsSzOptnNum
                           - IMG_DIMS_SZ_MIN_OPTN - 1 ≤ IMG_DIMS_SZ_MAX_OPTN
                           - IMG_DIMS_SZ_MIN_OPTN - 1' and therefore '0
                           ≤ imgDimsSzOptnNum - IMG_DIMS_SZ_MIN_OPTN - 1
                           - IMG_DIMS_SZ_MIN_OPTN + 1' or '0 ≤ imgDimsSzOptnNum
                           - IMG_DIMS_SZ_MIN_OPTN - 1
                           < AFTER_DIFF_OF_IMG_DIMS_SZ_LIMIT_OPTNS'. Using the
                           last relation, '(imgDimsSzOptnNum
                           - IMG_DIMS_SZ_MIN_OPTN - 1
                           + AFTER_DIFF_OF_IMG_DIMS_SZ_LIMIT_OPTNS)
                           %AFTER_DIFF_OF_IMG_DIMS_SZ_LIMIT_OPTNS
                           + IMG_DIMS_SZ_MIN_OPTN' is equal to 'imgDimsSzOptnNum
                           - IMG_DIMS_SZ_MIN_OPTN - 1 + IMG_DIMS_SZ_MIN_OPTN'
                           and thus results in 'imgDimsSzOptnNum - 1'. If
                           'imgDimsSzOptnNum' is equal to 'IMG_DIMS_SZ_MIN_OPTN',
                           then '(imgDimsSzOptnNum - IMG_DIMS_SZ_MIN_OPTN - 1
                           + AFTER_DIFF_OF_IMG_DIMS_SZ_LIMIT_OPTNS)
                           %AFTER_DIFF_OF_IMG_DIMS_SZ_LIMIT_OPTNS
                           + IMG_DIMS_SZ_MIN_OPTN' is equal to
                           '(IMG_DIMS_SZ_MIN_OPTN - IMG_DIMS_SZ_MIN_OPTN - 1
                           + AFTER_DIFF_OF_IMG_DIMS_SZ_LIMIT_OPTNS)
                           %AFTER_DIFF_OF_IMG_DIMS_SZ_LIMIT_OPTNS
                           + IMG_DIMS_SZ_MIN_OPTN', is equal to
                           '(AFTER_DIFF_OF_IMG_DIMS_SZ_LIMIT_OPTNS - 1)
                           %AFTER_DIFF_OF_IMG_DIMS_SZ_LIMIT_OPTNS
                           + IMG_DIMS_SZ_MIN_OPTN', is equal to
                           'AFTER_DIFF_OF_IMG_DIMS_SZ_LIMIT_OPTNS - 1
                           + IMG_DIMS_SZ_MIN_OPTN', is equal to
                           'IMG_DIMS_SZ_MAX_OPTN - IMG_DIMS_SZ_MIN_OPTN + 1 - 1
                           + IMG_DIMS_SZ_MIN_OPTN' and thus results in
                           'IMG_DIMS_SZ_MAX_OPTN'. */
                        /* 'byte' function call is necessary due to the variable
                           type. */
                        imgDimsSzOptnNum = byte((imgDimsSzOptnNum
                                                 - IMG_DIMS_SZ_MIN_OPTN - 1
                                                 + AFTER_DIFF_OF_IMG_DIMS_SZ_LIMIT_OPTNS)
                                                %AFTER_DIFF_OF_IMG_DIMS_SZ_LIMIT_OPTNS
                                                + IMG_DIMS_SZ_MIN_OPTN);
                        break;

                    case 'F':
                        /* keys for setting the following dimensions' size option
                           (clockwise direction) as the image drawing dimensions'
                           size option while considering the options
                           in a circular choice list and redrawing the image */
                        /* If 'IMG_DIMS_SZ_MIN_OPTN ≤ imgDimsSzOptnNum
                           ≤ IMG_DIMS_SZ_MAX_OPTN - 1', then
                           'IMG_DIMS_SZ_MIN_OPTN - IMG_DIMS_SZ_MIN_OPTN + 1
                           ≤ imgDimsSzOptnNum - IMG_DIMS_SZ_MIN_OPTN + 1
                           ≤ IMG_DIMS_SZ_MAX_OPTN - 1 - IMG_DIMS_SZ_MIN_OPTN + 1'
                           and hence '1 ≤ imgDimsSzOptnNum - IMG_DIMS_SZ_MIN_OPTN
                           + 1 < IMG_DIMS_SZ_MAX_OPTN - IMG_DIMS_SZ_MIN_OPTN + 1'
                           or '1 ≤ imgDimsSzOptnNum - IMG_DIMS_SZ_MIN_OPTN + 1
                           < AFTER_DIFF_OF_IMG_DIMS_SZ_LIMIT_OPTNS'. Using the
                           last relation, '(imgDimsSzOptnNum
                           - IMG_DIMS_SZ_MIN_OPTN + 1)
                           %AFTER_DIFF_OF_IMG_DIMS_SZ_LIMIT_OPTNS
                           + IMG_DIMS_SZ_MIN_OPTN' is equal to 'imgDimsSzOptnNum
                           - IMG_DIMS_SZ_MIN_OPTN + 1 + IMG_DIMS_SZ_MIN_OPTN'
                           and thus results in 'imgDimsSzOptnNum + 1'. If
                           'imgDimsSzOptnNum' is equal to 'IMG_DIMS_SZ_MAX_OPTN',
                           then '(imgDimsSzOptnNum - IMG_DIMS_SZ_MIN_OPTN + 1)
                           %AFTER_DIFF_OF_IMG_DIMS_SZ_LIMIT_OPTNS
                           + IMG_DIMS_SZ_MIN_OPTN' is equal to
                           '(IMG_DIMS_SZ_MAX_OPTN - IMG_DIMS_SZ_MIN_OPTN + 1)
                           %AFTER_DIFF_OF_IMG_DIMS_SZ_LIMIT_OPTNS
                           + IMG_DIMS_SZ_MIN_OPTN' or
                           'AFTER_DIFF_OF_IMG_DIMS_SZ_LIMIT_OPTNS
                           %AFTER_DIFF_OF_IMG_DIMS_SZ_LIMIT_OPTNS
                           + IMG_DIMS_SZ_MIN_OPTN' and thus results in
                           'IMG_DIMS_SZ_MIN_OPTN'. */
                        /* 'byte' function call is necessary due to the variable
                           type. */
                        imgDimsSzOptnNum = byte((imgDimsSzOptnNum
                                                 - IMG_DIMS_SZ_MIN_OPTN
                                                 + 1)
                                                %AFTER_DIFF_OF_IMG_DIMS_SZ_LIMIT_OPTNS
                                                + IMG_DIMS_SZ_MIN_OPTN);
                        redraw();
                        break;

                    case 'P':
                        /* keys for setting the previous dimensions' size option
                           (leftward direction) as the image drawing dimensions'
                           size option if such previous option is existent while
                           considering the options in a linear choice list and
                           redrawing the image */
                        /* 'byte' function call is necessary due to the variable
                           type. */
                        imgDimsSzOptnNum = byte(constrain(--imgDimsSzOptnNum,
                                                          IMG_DIMS_SZ_MIN_OPTN,
                                                          IMG_DIMS_SZ_MAX_OPTN));
                        break;

                    case 'N':
                        /* keys for setting the next dimensions' size option
                           (rightward direction) as the image drawing dimensions'
                           size option if such next option is existent while
                           considering the options in a linear choice list and
                           redrawing the image */
                        /* 'byte' function call is necessary due to the variable
                           type. */
                        imgDimsSzOptnNum = byte(constrain(++imgDimsSzOptnNum,
                                                          IMG_DIMS_SZ_MIN_OPTN,
                                                          IMG_DIMS_SZ_MAX_OPTN));
                        break;

                    default:

                }

                updatesDrawing = true;

            }

    }

}

/*
 * Executes the lines of code contained inside its block and related to
 * canvas's drawing in the current use mode.
 * Note: this function will be called continuously repeated until the program is
 *       stopped [if noLoop() is not called before].
 */
void draw() {

    switch (useModeNum) {

        case DRAW_MODE_NUM:

            if (updatesDrawing) {

                PShape star;

                background(RGB_ALL_COLORS_PALETTE[BACKGRND_COLOR_IDX]);

                if (imgDimsSzOptnNum != imgDimsSzPrevOptn
                    || imgFilIdx != imgPrevFilIdx) {

                    switch (imgDimsSzOptnNum) {

                        case IMG_DIMS_ORIG_SZ_OPTN:
                            imgDrawnWidthSz = img.width;
                            imgDrawnHeightSz = img.height;
                            break;

                        case IMG_FIXD_WIDTH_SZ_OPTN:
                            /* The drawn image has 'IMG_FIXD_WIDTH_SZ' as its
                               width size and the proportionally changed size of
                               the height as its height size. */
                            imgDrawnWidthSz = IMG_FIXD_WIDTH_SZ;
                            imgDrawnHeightSz = (img.height*IMG_FIXD_WIDTH_SZ)
                                               /img.width;
                            break;

                        case IMG_FIXD_HEIGHT_SZ_OPTN:
                            /* The drawn image has 'IMG_FIXD_HEIGHT_SZ' as the
                               height value and the proportionally changed value
                               of the width as its width size. */
                            imgDrawnWidthSz = (img.width*IMG_FIXD_HEIGHT_SZ)
                                              /img.height;
                            imgDrawnHeightSz = IMG_FIXD_HEIGHT_SZ;
                            break;

                        default:
                            /* The drawn image has '1/imgDimsSzOptnNum' of the
                               both original dimensions' size as the respective
                               dimensions' size. */
                            imgDrawnWidthSz = img.width/imgDimsSzOptnNum;
                            imgDrawnHeightSz = img.height/imgDimsSzOptnNum;

                    }

                    imgDrawnFirstCrnrPosX = (width - imgDrawnWidthSz)/2;
                    imgDrawnFirstCrnrPosY = (height - imgDrawnHeightSz)/2;
                    imgDrawnFourthCrnrPosX = (width + imgDrawnWidthSz)/2;
                    imgDrawnFourthCrnrPosY = (height + imgDrawnHeightSz)/2;

                }

                /* The image is drawn to the screen at a position of the canvas
                   so that it appears centered in the canvas. */
                image(img, imgDrawnFirstCrnrPosX, imgDrawnFirstCrnrPosY,
                      imgDrawnWidthSz, imgDrawnHeightSz);

                if (mouseX <= imgDrawnFirstCrnrPosX)
                    starCenterPosX = imgDrawnFirstCrnrPosX + 1;
                else if (imgDrawnFourthCrnrPosX <= mouseX)
                    starCenterPosX = imgDrawnFourthCrnrPosX - 1;
                else
                    starCenterPosX = mouseX;
                if (mouseY <= imgDrawnFirstCrnrPosY)
                    starCenterPosY = imgDrawnFirstCrnrPosY + 1;
                else if (imgDrawnFourthCrnrPosY <= mouseY)
                    starCenterPosY = imgDrawnFourthCrnrPosY - 1;
                else
                    starCenterPosY = mouseY;

                halfOfStarWidthSz = min(starCenterPosX - imgDrawnFirstCrnrPosX,
                                        imgDrawnFourthCrnrPosX - starCenterPosX);
                halfOfStarHeightSz = min(starCenterPosY - imgDrawnFirstCrnrPosY,
                                         imgDrawnFourthCrnrPosY
                                         - starCenterPosY);
                halfOfStarSmallestDimSz = min(halfOfStarWidthSz,
                                              halfOfStarHeightSz);
                /* The star is drawn in the mouse pointer's position with
                   the greatest size that does not go outside the image. */
                star(starCenterPosX, starCenterPosY,
                     halfOfStarSmallestDimSz/2, halfOfStarSmallestDimSz,
                     starPointsNum, STAR_STROKE_COLOR, STAR_FILL_COLOR);

                outputDrawingText();

                updatesDrawing = false;
                imgDimsSzPrevOptn = imgDimsSzOptnNum;
                imgPrevFilIdx = imgFilIdx;

            }

            break;

        case HELP_MODE_NUM:

            if (updatesHelp) {
                showHelp();
                updatesHelp = false;
            }

            break;

        default:

    }

}

void startDrawing() {

    if (img == null) {
        if (imgFilIdx == NO_IMG_FIL_IDX) {
            imgFilIdx = 1;
            imgFilNm = IMG_FIL_NM_PREFIX + imgFilIdx + IMG_FIL_NM_SUFFIX;
        }
        img = loadImage(imgFilNm);
    }
    imgDimsSzOptnNum = IMG_DIMS_ORIG_SZ_OPTN;
    starPointsNum = STAR_POINTS_INI_NUM;
    setUseMode(DRAW_MODE_NUM);

}

void redoDrawing() {

    if (img != null)
        setUseMode(DRAW_MODE_NUM);


}

void setUseMode(byte newUseModeNum) {

    useModeNum = newUseModeNum;
    switch (useModeNum) {
        case DRAW_MODE_NUM:
            updatesDrawing = true;
            updatesHelp = false;
            break;
        case HELP_MODE_NUM:
            updatesDrawing = false;
            updatesHelp = true;
            break;
        default:
    }

}

/*
 * (based on function from the Processing 2.0's Star example)
 */
void star(float centerPosX, float centerPosY, float radius_1, float radius_2,
          int pointsNum, color strokeColor, color fillColor) {

    float angle = TWO_PI/pointsNum;
    float halfAngle = angle/2;

    beginShape();
    stroke(strokeColor);
    fill(fillColor);

    for (float a = 0; a < TWO_PI; a += angle) {

        float sx = centerPosX + cos(a)*radius_2;
        float sy = centerPosY + sin(a)*radius_2;

        vertex(sx, sy);
        sx = centerPosX + cos(a + halfAngle)*radius_1;
        sy = centerPosY + sin(a + halfAngle)*radius_1;
        vertex(sx, sy);

    }

    endShape(CLOSE);

}

void outputDrawingText() {

    String imgDimsSzOptnDescr;

    /*
     *  drawing title
     */
    textFont(drawTitleTxtFnt);
    textSize(DRAW_TITLE_TXT_FNT_SZ);
    textAlign(CENTER);
    fill(DRAW_TITLE_TXT_COLOR);
    text("Drawing & playing", drawTitleTxtPosX, drawTitleTxtPosY);

    /*
     *  drawing info
     */

    textFont(drawImgInfoTxtFnt);
    textAlign(CENTER);
    fill(DRAW_IMG_INFO_TXT_COLOR);

    textSize(DRAW_IMG_INFO_TXT1_FNT_SZ);
    text("Source image #" + imgFilIdx + " – " + img.width + " × " + img.height
         + " px", drawImgInfoTxt1PosX, drawImgInfoTxt1PosY);

    imgDimsSzOptnDescr = "Drawing option ⇰ ";
    switch (imgDimsSzOptnNum) {
        case IMG_DIMS_ORIG_SZ_OPTN:
            imgDimsSzOptnDescr += "original dimensions’ size";
            break;
        case IMG_FIXD_WIDTH_SZ_OPTN:
            imgDimsSzOptnDescr += "fixed width of " + IMG_FIXD_WIDTH_SZ
                                  + " px and proportional value from original "
                                  + "height’ size";
            break;
        case IMG_FIXD_HEIGHT_SZ_OPTN:
            imgDimsSzOptnDescr += "fixed height of " + IMG_FIXD_HEIGHT_SZ
                                  + " px and proportional value from original "
                                  + "width’ size";
            break;
        default:
            imgDimsSzOptnDescr += "1∕" + imgDimsSzOptnNum
                                  + " of original dimensions’ size";
    }

    textSize(DRAW_IMG_INFO_TXT2_FNT_SZ);
    text(imgDimsSzOptnDescr, drawImgInfoTxt1PosX, drawImgInfoTxt2PosY);

}

void showHelp() {

    background(RGB_ALL_COLORS_PALETTE[BACKGRND_COLOR_IDX]);

    textFont(helpTitleTxtFnt);
    textSize(HELP_TITLE_TXT_FNT_SZ);
    textAlign(CENTER);
    fill(HELP_TITLE_TXT_COLOR);
    text("Basic help instructions", helpTitleTxtPosX, helpTitleTxtPosY);

    textFont(helpInstrctnsTxtFnt);
    textSize(HELP_INSTRCTNS_TXT_FNT_SZ);
    textAlign(LEFT);
    fill(HELP_INSTRCTNS_TXT_COLOR);
    text(helpInstrctnsStr, helpInstrctnsTxtPosX, helpInstrctnsTxtPosY);

}

