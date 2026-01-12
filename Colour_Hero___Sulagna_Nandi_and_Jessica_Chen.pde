/*
 Sulagna and Jessica
 Colour Hero 
 V. Krasteva
 Monday, January 18, 2021
 Colour Hero is a fun game to teach kindergarten-level students about basic colour theory! They are taught about warm and cool colours, mixing colours, and complementary colours in interactive lessons. They later have a chance to apply their skills in engaging and goal-oriented games for each of the concepts they learned. Rules that allow the program to flow are explained to the player within the game.

DISCLAIMER: This program was tested numerous times and on multiple devices, and a glitch involving mouse inputs was found. This glitch ONLY occurs when IMPRECISE mouse clicks or mouse presses are inputted by the user. We do not have the means to resolve this issue; please rerun the program and try to be more precise when giving mouse input if you run into any problems.


Variable dictionary
Name      Type    description/purpose of variable
r      color    general red colour.
ro      color    general red orange colour.
o      color    general orange colour.
yo      color    general yellow orange colour.
y      color    general yellow colour.
yg      color    general yellow green colour.
g      color    general green colour.
bg      color    general blue green colour.
b      color    general blue colour.
bv      color    general blue violet colour.
v      color    general violet colour.
rv      color    general red violet colour.
w      color    general white colour.
c      color    general black colour.

state      String    Starts as “start”, will tell you what method it 
is in. For program flow.
title      PFont    font for the title of the main menu. Is Comic Sans MS 
          bold, size 80
button1    PFont    font for the “Instructions” and “Quit” buttons on the 
          main menu. Is Helvetica Neue Medium, size 25,
button2    PFont    font for the start game button on the main menu. Is 
          Iowan Old Style Black, size 25.
boxFont    PFont    font for the crayons box in the prologue. Is Comic 
          Sans MS Bold, size 100.
lessonFont    PFont    font for the lessons. Berlin Sans FB Reg is the font 
          but Chalkboard can be used as an alternative. Size 
          48.
byeFont    PFont    font for goodbye(). Comic Sans MS Bold, size 100.
InstruTitle    PFont    title font for the instructions page. Is Apple SD
          Gothic Neo Bold, size 50.
InstruFont    PFont    general font for the instructions page. Is Comic Sans 
          MS, size 15.
gameFont    PFont    font for the games. Is Comic Sans Ms Bold, size 48.

transparencyPL  int    Deals with the transparency of things. This one is 
          for fading in the story in prologue().
transparencyPL2  int    For fading in the next page button.
transparencyL    int    For fading in the lesson information for all lesson
          pages.
transparencyL2  int    Fading in the game button for all lesson pages.

selectedBox    int    For determining which palette box the user clicked on
selectedColour  color    For colouring the pointer; used in evaluating a
user's answer
correcWC    Boolean  For determining if the user's answer in a gameWC
round is correct or incorrect 
correctM    Boolean      For determining if the user's answer in a gameM
round is correct or incorrect 
correctC    Boolean      For determining if the user's answer in a gameC
round is correct or incorrect 
crynC      color[]  For the random colour for the Evil Crayon in games
scoreCounterWC  int         For counting the user's score in gameWC
scoreCounterM    int         For counting the user's score in gameM
scoreCounterC    int         For counting the user's score in gameC
endGame    int         For changing the text showing up in afterGameC 
transpGameWC    int         For fading in text in gameWC
transpGameM    int         For fading in text in gameM
transpGameC    int         For fading in text in gameC
transpEndGame    int         For fading in the final text in afterGameC
roundCounter    int         The number of rounds each game will have

num      int    will generate a random number out of two. The
          number corresponds to a case in a switch that will
          decide which way the nose faces.
rand      int    will generate a random number out of three. Depending
          on whether the number is even or odd the mouth will
          be tilted in a different way.
wheelS<COLOUR VAR>  int    Arc size, one for each of the twelve colours in the
          colour wheel. will grow when you hover over the 
          rectangle of the colour.
circleS<COLOUR VAR> int    Circle size, one for each of the twelve colours in
          the colour wheel. Will grow when the rectangle of 
          the colour is pressed and held.

t      int    transparency of a grey rectangle responsible for
          fading out to give the illusion of the crayons 
          in the splash screen fading in.
rectS      int    size of the grey rectangle that looks like it is 
          sliding away revealing the crayons at the beginning
           of the splash screen.
borderH1    int    height of both borders in the splash screen. Part of 
          the splash screen animations, specifically for kind 
          of ending the first part with the crayons and 
          introducing the fake background and main menu.
borderY1    int    y coordinate of the bottom border that will help with 
          the transition from the crayon page in the splash 
          screen to the fake main menu.
borderY2    int    y coordinate of the top border with the same purpose 
          as the bottom border.
fbgY1      int    y coordinate of the bottom fake white background that 
is part of the transition from the crayons to the 
fake main menu. 
fbgY2      int    y coordinate of the top fake white background with 
          the same purpose as the bottom fake background.

instruChar    int    Determines whether or not the character is in the
 instructions page.  
*/
//GLOBAL VARIABLES ------------------------------------------------------------------
//Colours
color r = color(220, 70, 70);
color ro = color(255, 100, 0);
color o = color(255, 130, 0);
color yo = color(255, 200, 0);
color y = color(240, 240, 50);
color yg = color(130, 255, 30);
color g = color(70, 220, 70);
color bg = color(60, 160, 160);
color b = color(90, 90, 220);
color bv = color(130, 60, 220);
color v = color(160, 50, 180);
color rv = color(180, 60, 130);
color w = color(255);
color c = color(0);
//for what method stuff's in
String state  = "start";
//fonts
PFont title;
PFont button1;
PFont button2;
PFont boxFont;
PFont lessonFont;
PFont byeFont;
PFont InstruTitle;
PFont InstruFont;
PFont gameFont;
//transparency
int transparencyPL = 0; //for fading in the story
int transparencyPL2 = -600; //for fading in the "start training" button
int transparencyL = 0; //starting value for the lesson blurbs to fade in
int transparencyL2 = -1000; //starting value for the "I'm ready to fight the Evil Crayons" button's transparency, so it comes in a bit later
//Games
int selectedBox;
color selectedColour;
Boolean correctM = false;
Boolean correctC = false;
Boolean correctWC = false;
color[] crynC = new color[3];
//counting scores in each game
int scoreCounterM = 0;
int scoreCounterC = 0;
int scoreCounterWC = 0;
//fading in text in games
int endGame;
int transpGameM;
int transpGameC;
int transpGameWC;
int transpEndGame;
int roundCounter=10; //the number of rounds in the games (used to determine when to end a game)
//Character
int num = round(random(1, 2)); //both are for randomizing the way features face. Are global because it is for every time the method is called, not every time draw repeats
int rand = round(random(1, 3));
//Colour Wheel
int wheelSr, wheelSro, wheelSo, wheelSyo, wheelSy, wheelSyg, wheelSg, wheelSbg, wheelSb, wheelSbv, wheelSv, wheelSrv;
int circleSr, circleSro, circleSo, circleSyo, circleSy, circleSyg, circleSg, circleSbg, circleSb, circleSbv, circleSv, circleSrv;
//Splash Screen
int t = 255;
int rectS = 500;
int borderH1 = 60;
int borderY1 = 470;
int borderY2 = 30;
int fbgY1 = 650;
int fbgY2 = -150;
//Instructions
int instruChar = 0;




//NOT ACTUAL PAGES -------------------------------------------------------------------
//C h a r a c t e r
// This method is mostly for design purposes, where you want something that goes along with the theme of the game but that isn’t too much to look at too.
/*
name                             type      description/purpose of variable
crynX                             int      choose the x coordinate of the crayon, x
                                           coordinates all in relation with each
   other. Move the crayon as one.
crynY                             int      choose the y coordinate of the crayon, y 
                                           coordinates all in relation with each
    other, move the crayon as one.
crynS                             int      choose the size of the crayon, sizes all
                                           proportionate, scaleable.
crynC1                            int      choose the colour of the literal crayon.
crynC2                            int      choose the colour of the crayon wrapping.
ty                                int      alter the transparency of the entire
    crayon.
*/
void crayon(int crynX, int crynY, int crynS, int crynC1, int crynC2, int ty) {
  //Crayon part of character
  noStroke();
  rectMode(CENTER);
  ellipseMode(CENTER);
  //main body
  fill(crynC1, ty);
  rect(crynX, crynY, crynS, crynS*3);
  arc(crynX, crynY+crynS*3/2, crynS, crynS/5, 0, PI);
  arc(crynX, crynY-crynS*3/2, crynS, crynS/5, PI, TWO_PI);
  //point
  quad(crynX-crynS/3, crynY-crynS*3/2, crynX+crynS/3, crynY-crynS*3/2, crynX+crynS/8, crynY-crynS*9/4, crynX-crynS/8, crynY-crynS*9/4);
  //shaded part
  fill(0, 0, 0, 80-255+ty);
  quad(crynX+crynS*3/32, crynY-crynS*35/16, crynX+crynS/32, crynY-crynS*35/16, crynX+crynS/16, crynY-crynS*26/16, crynX+crynS*3/16, crynY-crynS*26/16);
  //body 2
  fill(crynC2, ty);
  rect(crynX, crynY, crynS*7/5, crynS*5/2);
  arc(crynX, crynY+crynS*5/2/2, crynS*7/5, crynS/5, 0, PI);
  arc(crynX, crynY-crynS*5/2/2, crynS*7/5, crynS/5, PI, TWO_PI);
  //highlighted part
  fill(255, 255, 255, 90-255+ty);
  rect(crynX-crynS*7/16, crynY, crynS*3/10, crynS*7/3);
  arc(crynX-crynS*19/64, crynY-crynS*117/100, crynS*3/5, crynS/10, PI, PI+HALF_PI);
  arc(crynX-crynS*19/64, crynY+crynS*117/100, crynS*3/5, crynS/10, HALF_PI, PI);
}

//full character here. This is the literal character that is present in a lot of pages but most importantly in the games.
/*
name                             type      description/purpose of variable
crynX                             int      choose the x coordinate of the character, x
                                           coordinates all in relation with each
    other. Move the character as one.
crynY                             int      choose the y coordinate of the character, y 
                                           coordinates all in relation with each
    other, move the character as one.
crynS                             int      choose the size of the character, sizes all
                                           proportionate, scaleable.
crynC1                            int      choose the colour of the literal character
    and character eyelids
crynC2                            int      choose the colour of the character
    wrapping.
ty                                int      alter the transparency of the entire
    character.

start    int    left bottom end point for eyelid. Start angle in the arc 
        for the eyelid. Is to help move the eyelid down.
stop    int    Same use as the above variable, just as the right and 
        bottom point and stop angle.
rand1    int    To decide when to blink, works with rand2.
rand2    int    To decide when to blink, works with rand1.
l    int    also helps with how often it blinks.

brow1X    int    was originally for a potential animation, is now just the 
        x coordinates of the first point of the left eyebrow.
browY    int    was for a similar reason, and is now for the y coordinates 
        of all points of both brows.
brow2X    int    same reason as the other x,  and the purpose is also very
 similar, just for the right eyebrow.
*/
/*
switch(num)    Randomly deciding the way the nose will face
while(start > 90)  Keeps the eyebrow moving down as long as it hasn’t yet reached the 
      bottom making it a complete circle.
*/
/*
if(rand %2 == 0)  Randomly deciding the way the mouth will face and in a way 
      independent of the nose.
if(num == 1)    For both. Deciding which way the eyes will point. Will be the 
      same way as the nose.
if(rand1 == rand2)  Will kind of stagger the blinking.
if(l%50 == 0)    sort of serves as a delay in the sense that it will make the 
      crayon blink slower than it initially would.
*/
void character(int crynX, int crynY, int crynS, color crynC1, color crynC2, int ty) {
  //body
  crayon(crynX, crynY, crynS, crynC1, crynC2, ty);

  //Details 
  //not animated
  noFill();
  stroke(0, ty);
  strokeWeight(1);
  //making the side the nose is on random
  switch(num) {
  case 1:
    beginShape();
    vertex(crynX, crynY-crynS/8);
    vertex(crynX-crynS/8, crynY+crynS/8);
    vertex(crynX, crynY+crynS/8);
    endShape(); // I do not want that ending line segment so I didn’t include the “CLOSE”
    break;
  case 2:
    beginShape();
    vertex(crynX, crynY-crynS/8);
    vertex(crynX+crynS/8, crynY+crynS/8);
    vertex(crynX, crynY+crynS/8);
    endShape(); //same here since this is just the above but the opposite direction
    break;
  }

  //mouth
  stroke(255, ty);
  strokeWeight(crynS/4);
  //different variable and randomizing technique so it will also randomize the side it’s tilted to but independant from the nose.
  if (rand %2 == 0) {
    line(crynX-crynS/3, crynY+crynS/2, crynX+crynS/3, crynY+crynS*5/8);
    stroke(0, ty);
    strokeWeight(3);
    line(crynX-crynS/10, crynY+crynS*11/20, crynX+crynS/3, crynY+crynS*5/8);
  } else {
    line(crynX+crynS/3, crynY+crynS/2, crynX-crynS/3, crynY+crynS*5/8);
    stroke(0, ty);
    strokeWeight(3);
    line(crynX+crynS/10, crynY+crynS*11/20, crynX-crynS/3, crynY+crynS*5/8);
  }

  //arms
  noFill();
  strokeWeight(crynS*3/16);
  stroke(crynC1, ty);
  arc(crynX+crynS/2, crynY+crynS*1/2, crynS*6/4, crynS*4/3, PI+PI*5/8, TWO_PI+QUARTER_PI);
  arc(crynX-crynS/2, crynY+crynS*1/2, crynS*6/4, crynS*4/3, HALF_PI+QUARTER_PI, PI+PI*3/8);

  //eyes
  noStroke();
  //whites
  fill(255, ty);
  ellipse(crynX-crynS*5/16, crynY-crynS*3/5, crynS/2*4/5, crynS/2);
  ellipse(crynX+crynS*5/16, crynY-crynS*3/5, crynS/2*4/5, crynS/2);
  //pupils
  fill(0, ty);
  //Deciding which way the eyes will point the same way, and therefore direction as the nose.
  if (num == 1) {
    ellipse(crynX-crynS*3/8, crynY-crynS*3/5, crynS/2*2/5, crynS/3);
    ellipse(crynX+crynS*1/4, crynY-crynS*3/5, crynS/2*2/5, crynS/3);
  } else {
    ellipse(crynX-crynS*1/4, crynY-crynS*3/5, crynS/2*2/5, crynS/3);
    ellipse(crynX+crynS*3/8, crynY-crynS*3/5, crynS/2*2/5, crynS/3);
  }
  //other thing
  fill(255, ty);
  if (num == 1) {
    ellipse(crynX-crynS*23/64, crynY-crynS*13/20, crynS/2/5, crynS/2/5);
    ellipse(crynX+crynS*19/64, crynY-crynS*13/20, crynS/2/5, crynS/2/5);
  } else {
    ellipse(crynX+crynS*23/64, crynY-crynS*13/20, crynS/2/5, crynS/2/5);
    ellipse(crynX-crynS*19/64, crynY-crynS*13/20, crynS/2/5, crynS/2/5);
  }
  //then have arcs here that I can manipulate for eyelids
  fill(crynC1, ty);
  //starting positions for the eyelids
  int start = 269;
  int stop = 271;
  //literal eyelids
  arc(crynX-crynS*5/16, crynY-crynS*3/5, crynS/2*4/5, crynS/2, radians(start), radians(stop), OPEN);
  arc(crynX+crynS*5/16, crynY-crynS*3/5, crynS/2*4/5, crynS/2, radians(start), radians(stop), OPEN);  
  //to decide when to blink
  int rand1 = round(random(1, 10));
  int rand2 = round(random(1, 10));
  //also helps with how often it bilnks
  int l = 0;
  if (rand1 == rand2) {
    //so it'll go until the eyelid is completely at the bottom, then reset.
    while (start>90) {
      if (l%50 == 0) {
        start -= 1;
        stop += 1;
        arc(crynX-crynS*5/16, crynY-crynS*3/5, crynS/2*4/5, crynS/2, radians(start), radians(stop), OPEN);
        arc(crynX+crynS*5/16, crynY-crynS*3/5, crynS/2*4/5, crynS/2, radians(start), radians(stop), OPEN);
      } else {
        arc(crynX-crynS*5/16, crynY-crynS*3/5, crynS/2*4/5, crynS/2, radians(start), radians(stop), OPEN);
        arc(crynX+crynS*5/16, crynY-crynS*3/5, crynS/2*4/5, crynS/2, radians(start), radians(stop), OPEN);
      }
      l ++;
    }
  } else {
    arc(crynX-crynS*5/16, crynY-crynS*3/5, crynS/2*4/5, crynS/2, radians(start), radians(stop), OPEN);
    arc(crynX+crynS*5/16, crynY-crynS*3/5, crynS/2*4/5, crynS/2, radians(start), radians(stop), OPEN);
  }

  //eyebrows
  fill(0, ty);
  //right eyebrow x coordinates
  int brow1X = crynX+crynS*3/5;
  //all eyebrow y coordinates
  int browY = crynY-crynS*21/20;
  //left eyebrow x coordinates
  int brow2X = crynX-crynS*3/5;
  quad(brow1X, browY, brow1X-crynS*13/30, browY+crynS*4/20, brow1X-crynS*11/20, browY+crynS*7/20, brow1X-crynS/10, browY+crynS*4/20);
  quad(brow2X, browY, brow2X+crynS*13/30, browY+crynS*4/20, brow2X+crynS*11/20, browY+crynS*7/20, brow2X+crynS/10, browY+crynS*4/20);
}




//L e s s o n   S t u f f
//Colour Wheel
//An interactive colour wheel that will help with teaching the concepts.
/*
if((mouseX >=  )     For all 12 colours this is only allowing all interactive 
&& (mouseX <=  )      parts to happen if they are at least hovering over the 
&& (mouseY >=  )      rectangle
&& (mouseY <=  )
else if(circleS > 0)  The circle will shrink if the mouse is no longer on the
 square.
else if(wheelS  > 120)  So the arc will shrink if you don’t press the mouse.
if(wheelS  < 160)    While hovering over their respective rectangles, all 12
 colours this will do the literal growing as long as the 
circle is less than 160 in width and height. 
if(mousePressed == true)  For all twelve colours this will allow the interactive
 parts to happen if they are pressing the mouse. They must
 also be over their rectangle though, since this is within the hovering conditional.
else if(circleS  > 0)  It will shrink if the mouse is no longer pressed if it
 grew.
if(circleS  < 120)    This is within the mousePressed within the mouseX mouseY
 hovering conditions meaning while the mouse is pressed on
 its rectangle, for all twelve colours its circle will grow
 as long as it is less than 120.
if(circleS == 120)    This is to ensure that the text only shows up once the
 colour’s circle is completely grown and covers the colour
 wheel. The only text that shows up no matter the lesson is
 the colour’s name
if(state.equals      So that the text shown here will only show up for
(“LessonWC”) == true)       this (warm and cool) lesson.
if(state.equals      Same reason as above but for the mixing lesson.
(“LessonM”) == true)
if(state.equals      Same reason as above but for the complementary lesson.
(“LessonC”) == true)
if(wheelS  > 120)    This one is within “else if(circleS > 0)” and it is like
this since the circle shrinks more so if I put it inside
 this then there will still be part of the circle visible
 when it no longer runs this since the arc is done   shrinking.
*/
void colWheel() { 
  //Wheel
  ellipseMode(CENTER);
  rectMode(CORNER);
  noStroke();
  //basically the same for every colour
  //red
  //colour
  fill(r);
  //arc
  arc(400, 250, wheelSr, wheelSr, PI+HALF_PI, radians(300));
  //rectangle
  rect(420, 153, 10, 10);
  //red orange
  fill(ro);
  arc(400, 250, wheelSro, wheelSro, radians(300), radians(330));
  rect(465, 175, 10, 10);
  //orange
  fill(o);
  arc(400, 250, wheelSo, wheelSo, radians(330), TWO_PI);
  rect(490, 220, 10, 10);
  //yellow orange
  fill(yo);
  arc(400, 250, wheelSyo, wheelSyo, 0, radians(30));
  rect(490, 270, 10, 10);
  //yellow
  fill(y);
  arc(400, 250, wheelSy, wheelSy, radians(30), radians(60));
  rect(465, 315, 10, 10);
  //yellow green
  fill(yg);
  arc(400, 250, wheelSyg, wheelSyg, radians(60), HALF_PI);
  rect(420, 338, 10, 10);
  //green
  fill(g);
  arc(400, 250, wheelSg, wheelSg, HALF_PI, radians(120));
  rect(370, 338, 10, 10);
  //blue green
  fill(bg);
  arc(400, 250, wheelSbg, wheelSbg, radians(120), radians(150));
  rect(325, 315, 10, 10);
  //blue
  fill(b);
  arc(400, 250, wheelSb, wheelSb, radians(150), PI);
  rect(300, 270, 10, 10);
  //blue violet
  fill(bv);
  arc(400, 250, wheelSbv, wheelSbv, PI, radians(210));
  rect(300, 220, 10, 10);
  //violet
  fill(v);
  arc(400, 250, wheelSv, wheelSv, radians(210), radians(240));
  rect(325, 175, 10, 10);
  //red violet
  fill(rv);
  arc(400, 250, wheelSrv, wheelSrv, radians(240), PI+HALF_PI);
  rect(370, 153, 10, 10);

  //circles
  fill(r);
  ellipse(400, 250, circleSr, circleSr);
  fill(ro);
  ellipse(400, 250, circleSro, circleSro);
  fill(o);
  ellipse(400, 250, circleSo, circleSo);
  fill(yo);
  ellipse(400, 250, circleSyo, circleSyo);
  fill(y);
  ellipse(400, 250, circleSy, circleSy);
  fill(yg);
  ellipse(400, 250, circleSyg, circleSyg);
  fill(g);
  ellipse(400, 250, circleSg, circleSg);
  fill(bg);
  ellipse(400, 250, circleSbg, circleSbg);
  fill(b);
  ellipse(400, 250, circleSb, circleSb);
  fill(bv);
  ellipse(400, 250, circleSbv, circleSbv);
  fill(v);
  ellipse(400, 250, circleSv, circleSv);
  fill(rv);
  ellipse(400, 250, circleSrv, circleSrv);


  //Animation/Interactivity
    //basically the same code for each of the 12 colours
  //red
  //arc growing
  if ((mouseX >= 420) && (mouseX <= 430) && (mouseY >= 153) && (mouseY <= 163)) {
    //If I make the below a seperate if statement it's smoother and just stays there when
    //it reaches there
    if (wheelSr < 160) { 
      wheelSr += 4;
    }
    //for the info that'd pop up
    if (mousePressed == true) {
      //growing the circle
      if (circleSr < 120) {
        circleSr += 5;
      }
     //so it only appears once the circle is completely drawn
      if (circleSr == 120) {
        //warm colours’ text will be black, cool colours’ red
        fill(0);
       //colour name will be in the same spot for all lessons. Some take up one line, others two
        text("red", 400, 225);
       //message changes depending on lesson
        if (state.equals("LessonWC") == true) {
          text("is a", 400, 255);
          text("warm colour", 400, 270);
        }
        if (state.equals("LessonM") == true) {
          text("is", 400, 255);
          text("primary", 400, 270);
        }
        if (state.equals("LessonC") == true) {
          text("and", 400, 255);
          text("green", 400, 270);
        }
      }
    }
    //it'll shrink if the mouse is no longer pressed
    else if (circleSr > 0) {
      circleSr -= 5;
    }
  }
  //it'll shrink if the mouse is no longer on the square
  else if (circleSr > 0) {
    circleSr -= 5;
    //so the arc will also shrink, the circle shrink more so this is inside that's
    if (wheelSr > 120) {
      wheelSr -= 2;
    }
  }
  //so the arc will still shrink even if you don't press the mouse to show the info
  else if (wheelSr > 120) {
    wheelSr -= 2;
  }
  //red orange
  if ((mouseX >= 465) && (mouseX <= 475) && (mouseY >= 175) && (mouseY <= 185)) {
    if (wheelSro < 160) { 
      wheelSro += 4;
    }
    if (mousePressed == true) {   
      if (circleSro < 120) {
        circleSro += 5;
      }
      if (circleSro == 120) {
        fill(0);
        text("red", 400, 225);
        text("orange", 400, 240);
        if (state.equals("LessonWC") == true) {
          text("is a", 400, 255);
          text("warm colour", 400, 270);
        }
        if (state.equals("LessonM") == true) {
          text("you mix red", 400, 255);
          text("and orange", 400, 270);
        }
        if (state.equals("LessonC") == true) {
          text("and", 400, 255);
          text("blue green", 400, 270);
        }
      }
    } else if (circleSro > 0) {
      circleSro -= 5;
    }
  } else if (circleSro > 0) {
    circleSro -= 5;
    if (wheelSro > 120) {
      wheelSro -= 2;
    }
  } else if (wheelSro > 120) {
    wheelSro -= 2;
  }
  //orange
  if ((mouseX >= 490) && (mouseX <= 500) && (mouseY >= 220) && (mouseY <= 230)) {
    if (wheelSo < 160) { 
      wheelSo += 4;
    }
    if (mousePressed == true) {   
      if (circleSo < 120) {
        circleSo += 5;
      }
      if (circleSo == 120) {
        fill(0);
        text("orange", 400, 225);
        if (state.equals("LessonWC") == true) {
          text("is a", 400, 255);
          text("warm colour", 400, 270);
        }
        if (state.equals("LessonM") == true) {
          text("you mix red", 400, 255);
          text("and yellow", 400, 270);
        }
        if (state.equals("LessonC") == true) {
          text("and", 400, 255);
          text("blue", 400, 270);
        }
      }
    } else if (circleSo > 0) {
      circleSo -= 5;
    }
  } else if (circleSo > 0) {
    circleSo -= 5;
    if (wheelSo > 120) {
      wheelSo -= 2;
    }
  } else if (wheelSo > 120) {
    wheelSo -= 2;
  }
  //yellow orange
  if ((mouseX >= 490) && (mouseX <= 500) && (mouseY >= 270) && (mouseY <= 280)) {
    if (wheelSyo < 160) { 
      wheelSyo += 4;
    }
    if (mousePressed == true) {   
      if (circleSyo < 120) {
        circleSyo += 5;
      }
      if (circleSyo == 120) {
        fill(0);
        text("yellow", 400, 225);
        text("orange", 400, 240);
        if (state.equals("LessonWC") == true) {
          text("is a", 400, 255);
          text("warm colour", 400, 270);
        }
        if (state.equals("LessonM") == true) {
          text("you mix yellow", 400, 255);
          text("and orange", 400, 270);
        }
        if (state.equals("LessonC") == true) {
          text("and", 400, 255);
          text("blue violet", 400, 270);
        }
      }
    } else if (circleSyo > 0) {
      circleSyo -= 5;
    }
  } else if (circleSyo > 0) {
    circleSyo -= 5;
    if (wheelSyo > 120) {
      wheelSyo -= 2;
    }
  } else if (wheelSyo > 120) {
    wheelSyo -= 2;
  }
  //yellow
  if ((mouseX >= 465) && (mouseX <= 475) && (mouseY >= 315) && (mouseY <= 325)) {
    if (wheelSy < 160) { 
      wheelSy += 4;
    }
    if (mousePressed == true) {   
      if (circleSy < 120) {
        circleSy += 5;
      }
      if (circleSy == 120) {
        fill(0);
        text("yellow", 400, 225);
        if (state.equals("LessonWC") == true) {
          text("is a", 400, 255);
          text("warm colour", 400, 270);
        }
        if (state.equals("LessonM") == true) {
          text("is", 400, 255);
          text("primary", 400, 270);
        }
        if (state.equals("LessonC") == true) {
          text("and", 400, 255);
          text("violet", 400, 270);
        }
      }
    } else if (circleSy > 0) {
      circleSy -= 5;
    }
  } else if (circleSy > 0) {
    circleSy -= 5;
    if (wheelSy > 120) {
      wheelSy -= 2;
    }
  } else if (wheelSy > 120) {
    wheelSy -= 2;
  }
  //yellow green
  if ((mouseX >= 420) && (mouseX <= 430) && (mouseY >= 338) && (mouseY <= 348)) {
    if (wheelSyg < 160) { 
      wheelSyg += 4;
    }
    if (mousePressed == true) {   
      if (circleSyg < 120) {
        circleSyg += 5;
      }
      if (circleSyg == 120) {
        fill(0);
        text("yellow", 400, 225);
        text("green", 400, 240);
        if (state.equals("LessonWC") == true) {
          text("is a", 400, 255);
          text("warm colour", 400, 270);
        }
        if (state.equals("LessonM") == true) {
          text("you mix yellow", 400, 255);
          text("and green", 400, 270);
        }
        if (state.equals("LessonC") == true) {
          text("and", 400, 255);
          text("red violet", 400, 270);
        }
      }
    } else if (circleSyg > 0) {
      circleSyg -= 5;
    }
  } else if (circleSyg > 0) {
    circleSyg -= 5;
    if (wheelSyg > 120) {
      wheelSyg -= 2;
    }
  } else if (wheelSyg > 120) {
    wheelSyg -= 2;
  }
  //green
  if ((mouseX >= 370) && (mouseX <= 380) && (mouseY >= 338) && (mouseY <= 348)) {
    if (wheelSg < 160) { 
      wheelSg += 4;
    }
    if (mousePressed == true) {   
      if (circleSg < 120) {
        circleSg += 5;
      }
      if (circleSg == 120) {
        fill(255);
        text("green", 400, 225);
        if (state.equals("LessonWC") == true) {
          text("is a", 400, 255);
          text("cool colour", 400, 270);
        }
        if (state.equals("LessonM") == true) {
          text("you mix yellow", 400, 255);
          text("and blue", 400, 270);
        }
        if (state.equals("LessonC") == true) {
          text("and", 400, 255);
          text("red", 400, 270);
        }
      }
    } else if (circleSg > 0) {
      circleSg -= 5;
    }
  } else if (circleSg > 0) {
    circleSg -= 5;
    if (wheelSg > 120) {
      wheelSg -= 2;
    }
  } else if (wheelSg > 120) {
    wheelSg -= 2;
  }
  //blue green
  if ((mouseX >= 325) && (mouseX <= 335) && (mouseY >= 315) && (mouseY <= 325)) {
    if (wheelSbg < 160) { 
      wheelSbg += 4;
    }
    if (mousePressed == true) {   
      if (circleSbg < 120) {
        circleSbg += 5;
      }
      if (circleSbg == 120) {
        fill(255);
        text("blue", 400, 225);
        text("green", 400, 240);
        if (state.equals("LessonWC") == true) {
          text("is a", 400, 255);
          text("cool colour", 400, 270);
        }
        if (state.equals("LessonM") == true) {
          text("you mix blue", 400, 255);
          text("and green", 400, 270);
        }
        if (state.equals("LessonC") == true) {
          text("and", 400, 255);
          text("red orange", 400, 270);
        }
      }
    } else if (circleSbg > 0) {
      circleSbg -= 5;
    }
  } else if (circleSbg > 0) {
    circleSbg -= 5;
    if (wheelSbg > 120) {
      wheelSbg -= 2;
    }
  } else if (wheelSbg > 120) {
    wheelSbg -= 2;
  }
  //blue
  if ((mouseX >= 300) && (mouseX <= 310) && (mouseY >= 270) && (mouseY <= 280)) {
    if (wheelSb < 160) { 
      wheelSb += 4;
    }
    if (mousePressed == true) {   
      if (circleSb < 120) {
        circleSb += 5;
      }
      if (circleSb == 120) {
        fill(255);
        text("blue", 400, 225);
        if (state.equals("LessonWC") == true) {
          text("is a", 400, 255);
          text("cool colour", 400, 270);
        }
        if (state.equals("LessonM") == true) {
          text("is", 400, 255);
          text("primary", 400, 270);
        }
        if (state.equals("LessonC") == true) {
          text("and", 400, 255);
          text("orange", 400, 270);
        }
      }
    } else if (circleSb > 0) {
      circleSb -= 5;
    }
  } else if (circleSb > 0) {
    circleSb -= 5;
    if (wheelSb > 120) {
      wheelSb -= 2;
    }
  } else if (wheelSb > 120) {
    wheelSb -= 2;
  }
  //blue violet
  if ((mouseX >= 300) && (mouseX <= 310) && (mouseY >= 220) && (mouseY <= 230)) {
    if (wheelSbv < 160) { 
      wheelSbv += 4;
    }
    if (mousePressed == true) {   
      if (circleSbv < 120) {
        circleSbv += 5;
      }
      if (circleSbv == 120) {
        fill(255);
        text("blue", 400, 225);
        text("violet", 400, 240);
        if (state.equals("LessonWC") == true) {
          text("is a", 400, 255);
          text("cool colour", 400, 270);
        }
        if (state.equals("LessonM") == true) {
          text("you mix blue", 400, 255);
          text("and violet", 400, 270);
        }
        if (state.equals("LessonC") == true) {
          text("and", 400, 255);
          text("yellow orange", 400, 270);
        }
      }
    } else if (circleSbv > 0) {
      circleSbv -= 5;
    }
  } else if (circleSbv > 0) {
    circleSbv -= 5;
    if (wheelSbv > 120) {
      wheelSbv -= 2;
    }
  } else if (wheelSbv > 120) {
    wheelSbv -= 2;
  }
  //violet
  if ((mouseX >= 325) && (mouseX <= 335) && (mouseY >= 175) && (mouseY <= 185)) {
    if (wheelSv < 160) { 
      wheelSv += 4;
    }
    if (mousePressed == true) {   
      if (circleSv < 120) {
        circleSv += 5;
      }
      if (circleSv == 120) {
        fill(255);
        text("violet", 400, 225);
        if (state.equals("LessonWC") == true) {
          text("is a", 400, 255);
          text("cool colour", 400, 270);
        }
        if (state.equals("LessonM") == true) {
          text("you mix blue", 400, 255);
          text("and red", 400, 270);
        }
        if (state.equals("LessonC") == true) {
          text("and", 400, 255);
          text("yellow", 400, 270);
        }
      }
    } else if (circleSv > 0) {
      circleSv -= 5;
    }
  } else if (circleSv > 0) {
    circleSv -= 5;
    if (wheelSv > 120) {
      wheelSv -= 2;
    }
  } else if (wheelSv > 120) {
    wheelSv -= 2;
  }
  //red violet
  if ((mouseX >= 370) && (mouseX <= 380) && (mouseY >= 153) && (mouseY <= 163)) {
    if (wheelSrv < 160) { 
      wheelSrv += 4;
    }
    if (mousePressed == true) {   
      if (circleSrv < 120) {
        circleSrv += 5;
      }
      if (circleSrv == 120) {
        fill(255);
        text("red", 400, 225);
        text("violet", 400, 240);
        if (state.equals("LessonWC") == true) {
          text("is a", 400, 255);
          text("cool colour", 400, 270);
        }
        if (state.equals("LessonM") == true) {
          text("you mix red", 400, 255);
          text("and violet", 400, 270);
        }
        if (state.equals("LessonC") == true) {
          text("and", 400, 255);
          text("yellow green", 400, 270);
        }
      }
    } else if (circleSrv > 0) {
      circleSrv -= 5;
    }
  } else if (circleSrv > 0) {
    circleSrv -= 5;
    if (wheelSrv > 120) {
      wheelSrv -= 2;
    }
  } else if (wheelSrv > 120) {
    wheelSrv -= 2;
  }
}






//PAGES ------------------------------------------------------------------------------
//Splash Screen
//It is the splash screen, but also, mMenu and nearly all other pages called within this method.
/*
if(rectS > 0)      rectS is the size of the two rectangles that move away 
        originally to kind of reveal the crayons a the beginning 
        of the splash screen. This is to keep them moving away as 
        long as they are above zero, so then you can move to the 
        next part.
else if(borderY1 > 250)  This is the else if of the previous statement so that once 
        that doesn’t work this will start. This is for the borders 
        to move in until they both reach the centre. Since they 
        start at the same place and move at the same speed only one 
        of them is necessary in the conditional. This is also where 
        you skip to when you click to skip.
else if((borderY2 == 250)  Also connected to the previous statements, this one is for 
&& (borderH1 > 15))    making sure the final animation before the fake menu, the 
        fake background, goes when the previous is done and only 
        until the entire screen is covered, no further.
if(t < 255)      This is within the else of the previous string of 
        conditionals. The t variable affects the transparency of 
        everything on the fake main menu so this makes 
        everything there fade in until they are completely in.
if((state.equals(“Quit”)  This here is to ensure that you can go back to the main 
== true) || (state.equals  menu from instructions and that you will go to the main 
(“Prologue” == true) ||   menu after the fake menu is faded in since this statement 
(state.equals(“Main Menu”)  is within the else of the one above.
 == true) || (state.equals
(“Instructions”) == true) 
|| (state.equals(“start”) 
== true))
else if(state.equals  This applies for everything from “LessonWC” to “GameC”. 
(“ “) == true)    It is the main controller of program flow but the literal 
        state changing is in mouseClicked()
*/
void splashScreen() {
  //state is not altered because this is the first thing that will show up

  //background
  background(200);

  //actual crayons/rectangles
  crayon(0, 270, 50, v, v, 255);
  fill(rv);
  rect(55, 270, 30, 80);
  crayon(130, 270, 80, r, r, 255);
  fill(ro);
  rect(208, 270, 30, 80);
  crayon(265, 270, 50, o, o, 255);
  fill(yo);
  rect(322, 270, 30, 80);
  crayon(400, 270, 80, y, y, 255);
  fill(yg);
  rect(478, 270, 30, 80);
  crayon(535, 270, 50, g, g, 255);
  fill(bg);
  rect(592, 270, 30, 80);
  crayon(670, 270, 80, b, b, 255);
  fill(bv);
  rect(745, 270, 30, 80);
  crayon(800, 270, 50, v, v, 255);

  //grey rectangle for fading purposes
  fill(200, t);
  rect(400, 250, 800, 380);
  //grey rectangles for sliding purposes
  fill(200);
  rect(400, 0, 800, rectS);
  rect(400, 500, 800, rectS);

  //border thingys
  fill(100);
  rectMode(CENTER);
  rect(400, borderY2, 800, borderH1);
  rect(400, borderY1, 800, borderH1);

  //fake background
  fill(255);
  rect(400, fbgY1, 800, 300);
  rect(400, fbgY2, 800, 300);

  //skip message
  fill(255);
  text("click anywhere to skip", 650, 480);


  //ANIMATIONS
  //so the borders start moving once the grey rectangles are done shrinking
  if (rectS > 0) {
    t -= 3;
    rectS -= 3;
  } 
  //if you skip (the code for that is in mouseClicked()) it will go to this part.
  //Move the borders in until they are centred vertically and kind of seem like one border.
  else if (borderY1 > 250) {
    borderY1 -= 4;
    borderY2 += 4;
    fbgY1 -= 4;
    fbgY2 += 4;
  } 
  //until the fake background(white screen) is completely covering the borders the borders will shrink and the fake background will move in
  else if ((borderY2 == 250) && (borderH1 > 15)) {
    borderH1 -= 5;
    fbgY1 -= 4;
    fbgY2 += 4;
  } 
  else {
   //fade a fake background with simplified characters, crayons, buttons, and a title in until it almost completely in.
    if (t < 255) {
      //fake background
      fill(100, t);
      rect(400, 250, 800, 500);
      //fake title
      textSize(60);
      text("COLOUR HERO", 180, 120);
      //fake crayons
      fill(240, t);
      rect(50, 90, 30, 120);
      rect(750, 90, 30, 120);
      fill(180, t);
      rect(80, 90, 30, 120);
      rect(720, 90, 30, 120);
      fill(120, t);
      rect(110, 90, 30, 120);
      rect(690, 90, 30, 120);
      //fake buttons
      fill(200, t);
      rect(400, 220, 200, 50);
      rect(400, 300, 300, 70);
      rect(400, 380, 100, 50);
      fill(100, t);
      textSize(15);
      text("Instructions", 360, 230);
      text("Play!", 385, 310);
      text("Quit", 385, 390);
      //fake character
      crayon(670, 350, 70, 120, 150, t);
      crayon(130, 350, 70, 150, 120, t);

      //animation
      t += 3;
    } 
    else {
      //everything here has to do with something in mouseClicked()
      //call the menu method. The other conditions are there so that you can go back to the menu once you go to another page.
      if ((state.equals("Quit") == true) || (state.equals("Prologue") == true) || (state.equals("Main Menu") == true) || (state.equals("Instructions") == true) || (state.equals("start") == true)) {
        mMenu();
      } 
     //here it’s just a button at the end of the previous page that leads it to the next.
      else if (state.equals("LessonWC") == true) {
        lessonWC();
      } else if (state.equals("GameWC") == true) {
        gameWC(crynC);
      } else if (state.equals("LessonM") == true) {
        lessonM();
      } else if (state.equals("GameM") == true) {
        gameM(crynC);
      } else if (state.equals("LessonC") == true) {
        lessonC();
      } else if (state.equals("GameC") == true) {
        gameC(crynC);
      }
    }
  }
}


//Main Menu
//mMenu() is the main menu page that has three buttons that can direct you to the instructions page, allow you to quit, or let you start the game. 
/*
if((state.equals    This is for the program flow within the main menu, so to 
(“Prologue”) ==     the instructions, to quit, and to start the game. 
false) && (state    Elaborated more in the else ifs
.equals
(“Instructions”)
 == false) && 
(state.equals
(“Quit”) == 
false))
else if((state.        For the above conditional, this will take you to the
equals(“Prologue”)    beginning of the lessons and the games, the prologue. For 
 == true))      all the following else ifs and this the actual state 
        changing will be elaborated more on in mouseClicked().
else if(state.    Is related to the above conditionals but this is to take 
equals(“Quit”)     you to the goodbye page.
== true)
else if(state.    Also related to the above but for the Instructions page.
equals(“
Instructions”)
 == true)
if((mouseX >=     This is within the if of the previous set of conditionals 
300) && (mouseX     and will make things happen when you hover over the 
<= 500) &&       Instructions button. I chose to make it kind of pop out.
(mouseY >= 195) 
&& (mouseY <= 
255))
if((mouse >=       The same placement (in the code) and reason as the above  
350) && (mouseX      statement but for the quit button.
<= 450) && 
(mouseY >= 355) 
&& (mouseY <= 
405))
if((mouseX >=      Also in the same spot in to code but it is for hovering 
 250) && (mouseX     over the start game button and the animation I chose was 
<= 550) &&      a kind of bolding for emphasis one.
(mouseY >= 265) 
&& (mouseY <= 
335))
*/
void mMenu() {
  if ((state.equals("Prologue") == false) && (state.equals("Instructions") == false) && (state.equals("Quit") == false)) {
    state = "Main Menu";
   //so the character will be there again if you decide to open Instructions again.
    instruChar = 0;
   //so the pointer will go back to black
   selectedColour = c;

    //background
    background(yg);
    //to change the rectMode back
    rectMode(CENTER);

    //crayons beside the title
    crayon(50, 90, 30, b, b, 255);
    crayon(80, 90, 30, bg, bg, 255);
    crayon(110, 90, 30, g, g, 255);
    crayon(750, 90, 30, o, o, 255);
    crayon(720, 90, 30, yo, yo, 255);
    crayon(690, 90, 30, y, y, 255);

    //title
    textFont(title);
    fill(255);
    text("Colour Hero!", 160, 130);
    fill(0);
    text("Colour Hero!", 170, 130);

    textFont(button1);
    //the animation that it pops out when you hover over it
    if ((mouseX >= 300) && (mouseX <= 500) && (mouseY >= 195) && (mouseY <= 255)) {
      noStroke();
      fill(0);
      rect(400, 220, 205, 55);
      stroke(255);
      strokeWeight(5);
      fill(v);
      rect(410, 210, 200, 50);
      fill(255);
      text("Instructions", 345, 220);
    } else {
      stroke(255);
      strokeWeight(5);
      fill(v);
      rect(400, 220, 200, 50);
      fill(0);
      text("Instructions", 335, 230);
    }
    //same animation but for the quit button
    if ((mouseX >= 350) && (mouseX <= 450) && (mouseY >= 355) && (mouseY <= 405)) {
      noStroke();
      fill(0);
      rect(400, 380, 105, 55);
      stroke(255);
      strokeWeight(5);
      fill(r);
      rect(410, 370, 100, 50);
      fill(255);
      text("Quit", 385, 380);
    } else {
      fill(r);
      rect(400, 380, 100, 50);
      fill(0);
      text("Quit", 375, 390);
    }
    textFont(button2);
    //bolding animation for the play the game button
    if ((mouseX >= 250) && (mouseX <= 550) && (mouseY >= 265) && (mouseY <= 335)) {
      stroke(0);
      strokeWeight(10);
      fill(rv);
      rect(400, 300, 300, 70);
      fill(255);
      text("Play the game!", 310, 310);
    } else {
      stroke(255);
      strokeWeight(5);
      fill(rv);
      rect(400, 300, 300, 70);
      fill(0);
      text("Play the game!", 310, 310);
    }

   //characters beside the buttons 
   character(670, 350, 70, b, bv, 255);
    character(130, 350, 70, r, ro, 255);
  } 
  //the actual interaction is in mouseClicked, but here is where you go for the buttons
  else if ((state.equals("Prologue") == true)) {
    prologue();
  } else if (state.equals("Quit") == true) {
    goodbye();
  } else if (state.equals("Instructions") == true) {
    instructions();
  }
}


//Instructions Page
//This is for giving an intro to the game.
/*
if(state.    This is for program flow, basically so it will stay in this page 
equals(“    while it is supposed to.
Instructions”)
 == true)
if((((mouseX    Because it is only one crayon, it is not random, and there are 
 >= 685-70*7/10  only two possible colours this is just saying that if you press 
…      the mouse with the right colour at the right place the crayon will 
      disappear. You notice that it changes a variable, and doesn’t just 
      not call the character. This is because this thing only runs when 
      the mouse is pressed so if I did that the character would only 
      disappear when the mouse is pressed. This way the change in 
      variable only needs to happen once. Once it happens the method 
      will be called and it will stay that way since you only need to 
      change the variable once for it to stay that way.
if(instruChar    So why I change the variable and not just call the method is 
 == 0)      explained above but basically this calls the method and is 
      responsible for the existence of the character.
*/
void instructions() {
  if (state.equals("Instructions") == true) {
    background(v);
    //setting rectMode
    rectMode(CORNER);
    //boxes under text
    noStroke();
    fill(255, 150);
    rect(50, 100, 637, 230);
    rect(50, 350, 360, 30);
    rect(430, 350, 200, 30);

    //title
    textFont(InstruTitle);
    text("Instructions", 50, 70);
    
    //instructions
    textFont(InstruFont);
    fill(bv);
    text("          Welcome! Today you will be battling crayons like the one on the right. \n First, choose a colour on the palette below by left clicking it. Colours that are \neffective will be explained in the lessons. After choosing, left click the \ncrayon you want to eliminate. You can try that out here by selecting one \nof this crayon's colours on the palette. Then click the crayon to remove \nit. Please try to be as precise as possible when giving mouse input and if a \nbutton doesn't specify what to do, please just click it.", 70, 138);
    text("More about the Evil Crayon Trio in the prologue!", 60, 370);
    text("Click any key to exit", 455, 370);

    //so you can remove the character when you click on it. It changes instruChar because if you just didn’t call the character here it would show up anyways when you stop pressing the mouse.
    if ((((mouseX >= 685-70*7/10) && (mouseX <= 685+70*7/10) && (mouseY <= 180+70*5/4) && (mouseY >= 180+70*5/4)) || ((mouseX >= 650) && (mouseX <= 720) && (mouseY >= 75) && (mouseY <= 285))) &&  ((selectedColour == b) || (selectedColour == bg)) && (mousePressed == true)) {
      instruChar = 1;
    }
    //the character part of the interaction
    if (instruChar == 0) {
      character(685, 180, 70, bg, b, 255);
    }

    //palette
    stroke(0);
    strokeWeight(5);
    rectMode(CORNER);
    palette();
    paletteInteraction();
    
    strokeWeight(5);
    stroke(selectedColour);
    line(mouseX-10, mouseY, mouseX+10, mouseY);
    line(mouseX, mouseY-10, mouseX, mouseY+10);
  }
}




void prologue() {
  if (state.equals("LessonWC") == false) {  
    state = "Prologue";
    prologueBG();
    rectMode(CENTER);
    character(100, 340, 40, 200, y, 255);
    character(290, 350, 45, 200, r, 255);
    character(200, 380, 60, 200, b, 255);
    pushMatrix();
    translate(300, 80);
    stroke(0, transparencyPL++);
    strokeWeight(3);
    fill(#BCF7A5, transparencyPL++);
    rect(100, 20, 600, 150, 30); //story
    fill(#F7A9A5, transparencyPL2++);
    stroke(0, transparencyPL2++);
    rect(100, 130, 400, 25, 45); //move to next pg
    textAlign(CENTER, CENTER);
    textSize(15);
    fill(0, transparencyPL++);
    text("The people of Colourville are in desperate need of your help! Three crayons have escaped from their box and have formed the Evil Crayon Trio. They say they're tired of humans using them all the time, and they're brewing up a plan to destroy humanity. You have to stop them! But there's only one way… defeat them with COLOUR THEORY!", 100, 20, 600-40, 150);
    textSize(12);
    fill(0, transparencyPL2++);
    text("Click here if you're ready to start your Colour Hero training!", 105, 127, 400, 25);
    popMatrix();
  }
}



//GRAPHICS FOR BLURB PARTS THAT ARE COMMON AMONG ALL LESSONS
void lessonBlurbs() {
  ellipse(width/2, height/2, 200, 200);

  strokeWeight(3);

  transparencyL2++;
  stroke(0, transparencyL2);
  fill(235, transparencyL2);
  rect(250, 400, 300, 40, 25); //move to next pg blurb
  fill(0, transparencyL2);
  textSize(15);
  text("I'm ready to fight the Evil Crayons!", width/2, 418);


  transparencyL++;
  stroke(0, transparencyL);
  fill(235);
  rect(100, 30, 600, 50, 10); //title blurb
  fill(235, transparencyL);
  rect(35, 125, 200, 300, 25); //left blurb  
  rect(565, 125, 200, 300, 25); //right blurb
  rect(155, 85, 490, 25, 10); //"click on this" blurb

  textAlign(CENTER, CENTER);
  textFont(lessonFont);
  textSize(15);
  fill(0, transparencyL);
}

//WARM AND COOL COLOURS LESSON
void lessonWC() {
  if (state.equals("GameWC") == false) { //if the program flow's state tells it to come to gameWC (after the user clicks the "Click here if you're ready to start your Colour Hero training!" button), the items below will be shown
    rectMode(CORNER);
    lessonBG();
    lessonBlurbs();
    colWheel();
    fill(0);
    textSize(15);
    text("Press on a coloured rectangle to see if that colour is warm or cool!", width/2, 95);
    text("These colours on the left  are the COOL COLOURS. They include the violets, blues and greens. You can remember that these are the cool colours by remembering that violet, blue and green are the colours of cool and cold objects.", 25+20, 125, 200-20, 300); //left blurb text
    text("These colours on the right are the WARM COLOURS. They include the reds, oranges, and yellows. You can remember that these are the warm colours by remembering that red, orange, and yellow are the colours of warm and hot objects.", 575, 125, 200-20, 300); //right blurb text
    textSize(40);
    text("WARM AND COOL COLOURS", width/2, 50); //title
  }
}




//MIXING COLOURS LESSON
void lessonM() {
  rectMode(CORNER);
  lessonBG();
  lessonBlurbs();
  colWheel();
  fill(0);
  text("Red, blue, and yellow are the primary (first-level) colours. Red and yellow make orange, blue and yellow make green, and red and blue make violet. Orange, green, and violet are called secondary (second-level) colours.", 25+20, 125, 200-20, 300); //left blurb text
  text("You can even mix secondary colours with primary colours to make tertiary (third-level) colours! Their names are just a combination of the two colours that make them (i.e. red-orange).", 575, 125, 200-20, 300); //right blurb text
  textSize(12);
  text("Press on a coloured rectangle to see which two colours make that colour!", width/2, 95);
  textSize(40);
  text("MIXING COLOURS", width/2, 50); //title
//resetting crayon and pointer colour so that the colours from the previous game are not shown
  crynC[1] = 0;
  crynC[2] = 0;
  selectedColour=0;
}



//COMPLEMENTARY COLOURS LESSON
void lessonC() {
  rectMode(CORNER);
  lessonBG();
  lessonBlurbs();
  colWheel();
  fill(0);
  text("Colours that are directly across from each other in the colour wheel are called complementary colours. Complementary colours are the opposite of (which means very different from) each other.", 25+20, 125, 200-20, 300); //left blurb text
  text("If you can make a straight line from one colour on the colour wheel to another colour, you know that those two colours are complementary.", 575, 125, 200-20, 300); //right blurb text
  textSize(14);
  text("Press on a coloured rectangle to see that colour's complementary colour!", width/2, 95);
  textSize(40);
  text("COMPLEMENTARY COLOURS", width/2, 50); //title
//resetting crayon and pointer colour so that the colours from the previous game are not shown
  crynC[1] = 0;
  crynC[2] = 0;
  selectedColour=0;
}




void goodbye() {
  goodbyeBG();
  fill(225);
  stroke(0);
  strokeWeight(5);
  rectMode(CORNER);

  pushMatrix();
  translate(0, -50);
  rect(100, 100, 600, 100, 45);
  rect(200, 210, 400, 100, 45);
  rect(300, 480, 200, 50, 45);
  noStroke();
  rect(20, 480, 250, 50, 45);
  rect(520, 480, 260, 50, 45);
  fill(0);
  textFont(byeFont);
  textAlign(CENTER, CENTER);
  textSize(60);
  text("GOODBYE!", 100, 90, 600, 100);
  textSize(30);
  text("Thank you for playing!", 200, 205, 400, 100);
  textSize(15);
  text("With help from processing.org", 145, 503);
  text("By: Sulagna and Jessica", 400, 503);
  text("Press any key to exit!", 652, 503);
  popMatrix();

  crayon(100, 280, 80, rv, b, 255);
  crayon(700, 280, 80, r, yo, 255);
  character(320, 350, 30, 125, b, 255);
  character(400, 350, 30, 125, r, 255);
  character(480, 350, 30, 125, y, 255);
}






//SOME INTERACTIVITY -----------------------------------------------------------------
//mouseClicked
//some of the mouseClicked interaction
void mouseClicked() {
  //splash screen skipping
  if (state.equals("start") == true) {
    if (borderY1 > 250) {
      //Changed the values so it works for the if else that moves the borders in
      t = 0;
      rectS = 0;
     //Certain things are off so the way they move must differ 
      borderY1 -= 4;
      borderY2 += 4;
      fbgY1 -= 4;
      fbgY2 += 4;
    }
  }
  //main menu buttons
  //NOTE: like briefly and similarly covered in instructions(), the state is changed because you just need to change it once for it to stay that way. If you directly called the method in the statement, it’d only run while the mouse is being clicked.
  if (state.equals("Main Menu") == true) {
    //button to start the game
    if ((mouseX >= 250) && (mouseX <= 550) && (mouseY >= 265) && (mouseY <= 335)) {
      state = "Prologue";
    }
    //to go to the instructions page
    if ((mouseX >= 300) && (mouseX <= 500) && (mouseY >= 195) && (mouseY <= 245)) {
      state = "Instructions";
    }
   //to go to the goodbye page
    if ((mouseX >= 350) && (mouseX <= 450) && (mouseY >= 355) && (mouseY <= 405)) {
      state = "Quit";
    }
  }
//now it is just all the buttons to go to the next page. Many of these have along with the state and mouseX mouseY conditions conditions that only allow it to work once the button has faded in similar.
  if ((state.equals("Prologue") == true) && (mouseX >= 100) && (mouseX <= 500) && (mouseY >= 200) && (mouseY <= 221) && (transparencyPL2 >=100)) {
    state = "LessonWC";
  }
  if ((state.equals("LessonWC") == true) && (mouseX >= 250) && (mouseX <= 550) && (mouseY >= 400) && (mouseY <= 440) && (transparencyL2 >= 50)) {
    state = "GameWC";
  }
  if ((state.equals("GameWC") == true) && (mouseX >= 200) && (mouseX <= 600) && (mouseY >= 322) && (mouseY <= 387) && (scoreCounterWC==roundCounter)) {
    state = "LessonM";
  }
  if ((state.equals("LessonM") == true) && (mouseX >= 250) && (mouseX <= 550) && (mouseY >= 400) && (mouseY <= 440) && (transparencyL2 >= 50)) {
    state = "GameM";
  }
  if ((state.equals("GameM") == true) && (mouseX >= 200) && (mouseX <= 600) && (mouseY >= 322) && (mouseY <= 387) && (scoreCounterM==roundCounter)) {
    state = "LessonC";
  }
  if ((state.equals("LessonC") == true) && (mouseX >= 250) && (mouseX <= 550) && (mouseY >= 400) && (mouseY <= 440) && (transparencyL2 >= 50)) {
    state = "GameC";
  }
  if ((state.equals("GameC") == true) && (mouseX >= 200) && (mouseX <= 600) && (mouseY >= 322) && (mouseY <= 387) && (scoreCounterC==roundCounter)) {
    state = "Quit";
  }
}
void keyPressed() {
  //to get out of the instructions page.
  if (state.equals("Instructions") == true) {
    state = "Main Menu";
  }
  //to leave the program from the goodbye page
  if (state.equals("Quit") == true) {
    exit();
  }
}




//DRAW AND SETUP ---------------------------------------------------------------------
void draw() {
  splashScreen();
}
void setup() {
  size(800, 500);
  //similar variables, so they can all be declared together
  wheelSr = wheelSro = wheelSo = wheelSyo = wheelSy = wheelSyg = wheelSg = wheelSbg = wheelSb = wheelSbv = wheelSv = wheelSrv = 120;
  circleSr = circleSro = circleSo = circleSyo = circleSy = circleSyg = circleSg = circleSbg = circleSb = circleSbv = circleSv = circleSrv = 0;
  //fonts
  //main menu
  title = createFont("ComicSansMS-Bold", 80);
  button1 = createFont("HelveticaNeue-Medium", 25);
  button2 = createFont("IowanOldStyle-Black", 25);
  //instructions
  InstruTitle = createFont("AppleSDGothicNeo-Bold", 50);
  InstruFont = createFont("ComicSansMS", 15);
  //prologue
  boxFont = createFont("ComicSansMS-Bold", 100); //or "Comic Sans MS Bold"
  lessonFont = createFont("Chalkboard", 48); //or "BerlinSansFB-Reg"
  //game
  gameFont = createFont("ComicSansMS-Bold", 48); //or "Comic Sans MS Bold"
  //goodbye
  byeFont = createFont("ComicSansMS-Bold", 100); //or "Comic Sans MS Bold"
}








//WARM AND COOL COLOURS GAME
/*
name                             type      description/purpose of variable

threeColours                     color[]   Stores values obtained by crynC (from 
   randomWarmCoolColor method) under the local
   variable threeColours. Elements 1 and 2 are
   used to colour the Evil Crayon.  
*/
void gameWC(color[] threeColours) {
  gameBG();
  if (scoreCounterWC<=roundCounter) { //until the player has reached 10 points yet, the game will continue
    titleWC();
    buttonsWC();
    fill(#E8F6F7, transpGameWC++);
    textSize(15);
    text("SCORE = " + scoreCounterWC, 400, 100);
    if (scoreCounterWC==0 && correctWC==false) {  //start of the first round (instructions should only show up in the first round)
      instructionsTextWC();

      if (keyPressed == true) { //when the user presses a key, the crayon will get a random colour based on the called array
        crynC = randomWarmCoolColor();
      } 
      character(width/2, 400-85, 40, threeColours[1], threeColours[2], 255);
      buttonInteraction();
      if (correctWC==true) scoreCounterWC++; //if correctWC is turned true in buttonInteraction (user's answer is correct), 1 pt is given to the user
    } //end of the first round


    if (scoreCounterWC>0 & scoreCounterWC<=roundCounter) {  //main block for the game (for all rounds after the first round)
      if (correctWC == true) { //when the user's answer is correct, they'll be shown this message
        textSize(60);
        fill(0, 255, 0);
        text("RIGHT ON!", 400, 235);
        textSize(30);
        fill(255, 0, 255);
        text("PRESS ANY KEY TO CONTINUE", 400, 340);
//note: message for wrong answer is in buttonInteraction
        if (keyPressed == true) {  //randomizing colour for  the crayon again when the user moves on to the next round
          crynC = randomWarmCoolColor();     
          correctWC = false;
        }
      }

      if (correctWC == false & scoreCounterWC<roundCounter) { //only when correctWC is false and the game is still going on, the crayon will be shown
        character(width/2, 400-85, 40, threeColours[1], threeColours[2], 255);
        buttonInteraction();
        if (correctWC==true) scoreCounterWC++; //if correctWC is turned true in buttonInteraction (user's answer is correct), 1 pt is given to the user
      }
    }    // end of the main block for the game
  }   // end of the block for the entire game (including first round)

  if (correctWC == false & scoreCounterWC==roundCounter) { //after the game is complete, the text in afterGameWC shows up; two transparency variables that are used to fade in lesson blurbs are reset 
    afterGameWC();
    transparencyL=0;
    transparencyL2=-1000;
  }

//user's plus-shaped pointer
  strokeWeight(5);
  stroke(threeColours[1]);
  line(mouseX-10, mouseY, mouseX+10, mouseY);
  line(mouseX, mouseY-10, mouseX, mouseY+10);
}

//MIXING COLOURS GAME
/*
name                             type      description/purpose of variable

threeColours                     color[]   Stores values obtained by crynC (from 
   randomMixingColor method) under the local
   variable threeColours. Elements 1 and 2 are
   used to colour the Evil Crayon.  
*/
void gameM(color[] threeColours) {

  gameBG();

  if (scoreCounterM<=roundCounter) { //until the player has reached 10 points yet, the game will continue
    titleM();
    palette();
    fill(#E8F6F7, transpGameM++);
   textSize(15);
    text("SCORE = " + scoreCounterM, 400, 100);
    if (scoreCounterM==0 && correctM==false) {  //start of the first round (instructions should only show up in the first round)
      instructionsTextM();
      if (keyPressed == true) { //when the user presses a key, the crayon will get a random colour based on the called array
        crynC = randomMixingColor();
      } 
      character(width/2, 400-85, 40, threeColours[1], threeColours[2], 255);
      paletteInteraction(); 
      if (correctM==true) scoreCounterM++; //if correctM is turned true in paletteInteraction (user's answer is correct), 1 pt is given to the user
    } //end of the first round


    if (scoreCounterM>0 & scoreCounterM<=roundCounter) {  //main block for the game (for all rounds after the first round)
      if (correctM == true) { //when the user's answer is correct, they'll be shown this message
        textSize(60);
        fill(0, 255, 0);
        text("RIGHT ON!", 400, 235);
        textSize(30);
        fill(255, 0, 255);
        text("PRESS ANY KEY TO CONTINUE", 400, 340);
//note: message for wrong answer is in paletteInteraction
        if (keyPressed == true) { //randomizing colour for the crayon again when the user moves on to the next round
          crynC = randomMixingColor();     
          correctM = false;
        }
      }

      if (correctM == false & scoreCounterM<roundCounter) { //only when correctM is false and the game is still going on, the crayon will be shown
        character(width/2, 400-85, 40, threeColours[1], threeColours[2], 255);
        paletteInteraction();
        if (correctM==true) scoreCounterM++; //if correctM is turned true in paletteInteraction (user's answer is correct), 1 pt is given to the user

      }
     }    // end of the main block for the game
  }   // end of the block for the entire game (including first round)

  if (correctM == false & scoreCounterM==roundCounter) { //after the game is complete, the text in afterGameM shows up; two transparency variables that are used to fade in lesson blurbs are reset 

    afterGameM();
    transparencyL=0;
    transparencyL2=-1000;
    correctC=false; //along with correctM, correctC is turned true in paletteInteraction; it is turned false in order enter gameC (two pages later)
  }

//user's plus-shaped pointer
  strokeWeight(5);
  stroke(selectedColour);
  line(mouseX-10, mouseY, mouseX+10, mouseY);
  line(mouseX, mouseY-10, mouseX, mouseY+10);
}


//COMPLEMENTARY COLOURS GAME
/*
name                             type      description/purpose of variable

threeColours                     color[]   Stores values obtained by crynC (from 
   randomComplementaryColor method) under the
   local variable threeColours. Elements 1 and
   2 are used to colour the Evil Crayon.  
*/
void gameC(color[] threeColours) {
  gameBG();

  if (scoreCounterC<=roundCounter) { //until the player has reached 10 points yet, the game will continue
    titleC();
    palette();
    fill(#E8F6F7, transpGameC++);
    textSize(15);
    text("SCORE = " + scoreCounterC, 400, 100);
    if (scoreCounterC==0 && correctC==false) {  //start of the first round (instructions should only show up in the first round)

      instructionsTextC();

      if (keyPressed == true) {  //when the user presses a key, the crayon will get a random colour based on the called array

        crynC = randomComplementaryColor();
      } 
      character(width/2, 400-85, 40, threeColours[1], threeColours[2], 255);
      paletteInteraction(); 
      if (correctC==true) scoreCounterC++; //if correctC is turned true in paletteInteraction (user's answer is correct), 1 pt is given to the user
    } //end of the first round


    if (scoreCounterC>0 & scoreCounterC<=roundCounter) {  //main block for the game (for all rounds after the first round)
      if (correctC == true) { //when the user's answer is correct, they'll be shown this message
        textSize(60);
        fill(0, 255, 0);
        text("RIGHT ON!", 400, 235);
        textSize(30);
        fill(255, 0, 255);
        text("PRESS ANY KEY TO CONTINUE", 400, 340);
//note: message for wrong answer is in paletteInteraction
        if (keyPressed == true) { //randomizing colour for the crayon again when the user moves on to the next round
          crynC = randomComplementaryColor();     
          correctC = false;
        }
      }

      if (correctC == false & scoreCounterC<roundCounter) { //only when correctC is false and the game is still going on, the crayon will be shown

        character(width/2, 400-85, 40, threeColours[1], threeColours[2], 255);
        paletteInteraction();
        if (correctC==true) scoreCounterC++; //if correctC is turned true in paletteInteraction (user's answer is correct), 1 pt is given to the user

      }
      }    // end of the main block for the game
  }   // end of the block for the entire game (including first round)

  if (correctC == false & scoreCounterC==roundCounter) { //after the game is complete, the text in afterGameC shows up
    afterGameC();
  }

//user's plus-shaped pointer
  strokeWeight(5);
  stroke(selectedColour);
  line(mouseX-10, mouseY, mouseX+10, mouseY);
  line(mouseX, mouseY-10, mouseX, mouseY+10);
}


//TITLE FOR WARM AND COOL COLOURS GAME
void titleWC() {
  fill(255, transpGameWC++);
  textFont(gameFont);
  textAlign(CENTER, CENTER);
  textSize(40);
  text("WARM AND COOL COLOURS GAME", -3, -35, 800, 100);
}

//INSTRUCTIONS FOR WARM AND COOL COLOURS GAME
void instructionsTextWC() {
  if (correctWC==false) { //only when correctWC is false (which it is by default) the instructions text will show up
    textAlign(CENTER, CENTER);
    fill(255, transpGameWC++);
    textSize(12);
    text("1. Press any key to give the Evil Crayon a colour, and determine which colour it is.", 25, 195, 300, 100);
    text("2. Next, figure out if the Evil Crayon's colour is a warm colour or cool colour.", 475, 195, 300, 100); 
    text("3. Once you have your answer, click on the corresponding box to defeat the Evil Crayon!", 25, 300, 300, 100);
    text("4. Keep playing until you reach 10 points.", 475, 300, 300, 100);
  }
}

//TEXT THAT SHOWS UP WHEN THE USER HAS REACHED 10 POINTS IN GAME_WC
void afterGameWC() {
  gameBG();
  textFont(gameFont);
  fill(#C5FAD3, transpGameWC++);
  textAlign(CENTER, CENTER);
  textSize(18);
  text("YOU DID IT! YOU DEFEATED THE EVIL CRAYON WITH YOUR AWESOME WARM AND COOL COLOUR IDENTIFYING SKILLS!", 100, 195, 600, 100);

  stroke(255);
  fill(#6F0823);
  rect(200, 322, 400, 65, 50);
  textSize(15);
  fill(255);
  text("Click here to move on to the next part of your Colour Hero training!", 250, 300, 300, 100);
}


//TITLE FOR MIXING COLOURS GAME
void titleM() {
  fill(255, transpGameM++);
  textFont(gameFont);
  textAlign(CENTER, CENTER);
  textSize(40);
  text("MIXING COLOURS GAME", 50+20, -35, 700-40, 100);
}

//INSTRUCTIONS FOR MIXING COLOURS GAME
void instructionsTextM() {
  if (correctM==false) { //only when correctM is false (which it is by default) the instructions text will show up
    textAlign(CENTER, CENTER);
    fill(255, transpGameM++);
    textSize(12);
    text("1. Press any key to give the Evil Crayon two different colours.", 25, 195, 300, 100);
    text("2. Look at the two different colours of the Evil Crayon and figure out which colour those two colours make.", 475, 195, 300, 100); 
    text("3. Once you have your answer, click on that colour on the palette with your pointer.", 25, 300, 300, 100);
    text("4. Then click on the Evil Crayon to defeat it! Keep playing until you reach 10 points.", 475, 300, 300, 100);
  }
}

//TEXT THAT SHOWS UP WHEN THE USER HAS REACH 10 POINTS IN GAME_M
void afterGameM() {
  gameBG();
  textFont(gameFont);
  fill(#C5FAD3);
  textAlign(CENTER, CENTER);
  textSize(20);
  text("YOU DID IT! YOU DEFEATED THE EVIL CRAYON WITH YOUR AWESOME COLOUR MIXING SKILLS!", 100, 195, 600, 100);

  stroke(255);
  fill(#6F0823);
  rect(200, 322, 400, 65, 50);
  textSize(15);
  fill(255);
  text("Click here to move on to the next part of your Colour Hero training!", 250, 300, 300, 100);
}





//TITLE FOR COMPLEMENTARY COLOURS GAME
void titleC() {
  fill(255, transpGameC++);
  textFont(gameFont);
  textAlign(CENTER, CENTER);
  textSize(40);
  text("COMPLEMENTARY COLOURS GAME", 0, -35, 800, 100);
}

//INSTRUCTIONS FOR COMPLEMENTARY COLOURS GAME
void instructionsTextC() {
  if (correctC==false) { //only when correctC is false (which it is by default) the instructions text will show up
    textAlign(CENTER, CENTER);
    fill(255, transpGameC++);
    textSize(12);
    text("1. Press any key to give the Evil Crayon a colour, and figure out which colour it is.", 25, 195, 300, 100);
    text("2. Next, figure out what the complementary colour of the Evil Crayon's colour is.", 475, 195, 300, 100); 
    text("3. Once you have your answer, click on that colour on the palette with your pointer.", 25, 300, 300, 100);
    text("4. Then click on the Evil Crayon to defeat it! Keep playing until you reach 10 points.", 475, 300, 300, 100);
  }
}

//TEXT THAT SHOWS UP WHEN THE USER HAS REACHED 10 POINTS IN GAME_C
void afterGameC() {
  gameBG();
  textAlign(CENTER, CENTER);
  if (endGame<400) { //text inside this statement will stay for a few seconds (500 frames)
    fill(#C5FAD3);
    textSize(20);
    text("YOU DID IT! YOU DEFEATED THE EVIL CRAYON WITH YOUR AWESOME COMPLEMENTARY COLOUR FINDING SKILLS!\nAnd at last...", 100, 195, 600, 100);
    endGame++;
  } else { //after a few seconds (500 frames) the previous text will be replaced with the text below
    transpEndGame++;
    fill(#C5FAD3, transpEndGame);
    textSize(20);
    text("You've saved the people of Colourville from the Evil Crayon Trio, and now you're a full-fledged COLOUR HERO! Congratulations!!!", 100, 195, 600, 100);
    stroke(255, transpEndGame);
    fill(#6F0823, transpEndGame);
    rect(200, 322, 400, 65, 50);
    textSize(20);
    fill(255, transpEndGame);
    text("Click here to exit.", 250, 300, 300, 100);
  }
}



//GRAPHICS FOR THE PALETTE USED IN GAME_M AND GAME_C
void palette() {
  fill(r);
  rect(0, 400, 66, 100);
  pushMatrix();
  translate(66, 0);
  fill(ro);
  rect(0, 400, 66, 100);

  translate(66, 0);
  fill(o);
  rect(0, 400, 66, 100);

  translate(66, 0);
  fill(yo);
  rect(0, 400, 66, 100);

  translate(66, 0);
  fill(y);
  rect(0, 400, 66, 100);

  translate(66, 0);
  fill(yg);
  rect(0, 400, 66, 100);

  translate(66, 0);
  fill(g);
  rect(0, 400, 66, 100);

  translate(66, 0);
  fill(bg);
  rect(0, 400, 66, 100);

  translate(66, 0);
  fill(b);
  rect(0, 400, 66, 100);

  translate(66, 0);
  fill(bv);
  rect(0, 400, 66, 100);

  translate(66, 0);
  fill(v);
  rect(0, 400, 69, 100);

  translate(66, 0);
  fill(rv);
  rect(4, 400, 69, 100);
  popMatrix();
}


//MOUSE INTERACTION WITH THE PALETTE IN GAME_M AND GAME_C
void paletteInteraction() {
  if (mouseY>400) { //the entire palette is below 400-y, so the user's mouse must be below 400-y to click on the on the palette and enter this conditional
    selectedBox = mouseX/66; //the user's mouse's x-coordinate is divided by 66 because each palette box is 66 pixels wide
    stroke(0);
    strokeWeight(5);
    switch (selectedBox) { //the number obtained by selectedBox (when converted to an int) is used here to figure out which palette box the user clicked on, and then assign a colour to selectedColour accordingly.
//selectedColour is used to colour the user's pointer and to evaluate their answer in a gameM or gameC round
    case 0:             
      if (mousePressed)          selectedColour = r;       
      break;
    case 1:             
      if (mousePressed)          selectedColour = ro;      
      break;
    case 2:             
      if (mousePressed)          selectedColour = o;       
      break;
    case 3:             
      if (mousePressed)          selectedColour = yo;      
      break;
    case 4:             
      if (mousePressed)          selectedColour = y;       
      break;
    case 5:             
      if (mousePressed)          selectedColour = yg;      
      break;
    case 6:             
      if (mousePressed)          selectedColour = g;       
      break;
    case 7:             
      if (mousePressed)          selectedColour = bg;      
      break;
    case 8:             
      if (mousePressed)          selectedColour = b;       
      break;
    case 9:             
      if (mousePressed)          selectedColour = bv;      
      break;
    case 10:            
      if  (mousePressed)          selectedColour = v;       
      break;
    case 11:            
      if (mousePressed)          selectedColour = rv;      
      break;
    }
  }
if (state.equals("Instructions") == false) { //will not enter this statement if it is in the instructions page (as the crayon has a different locations on the instructions page)
  if ((mouseX>width/2-60 & mouseX<width/2+60) && (mouseY>400-85-40*2 & mouseY<400-85+40*2)) { 
    if (mousePressed) { //when the user clicks on the crayon (coordinates range above), their answer is evaluated 
      correctM = crynC[0]==selectedColour; //testing if the answer (element 0 in the color array) is equivalent to the selectedColour of the user IN GAME_M
      correctC = crynC[0]==selectedColour; //testing if the answer (element 0 in the color array) is equivalent to the selectedColour of the user IN GAME_C; turned false at the end of GAME_M 
      if (correctM || correctC) { 
      } else { //when both correctM and correctC are false (both are always the same value when going through paletteInteraction), "Try Again!" is shown; used for when the user's answer is incorrect
        fill(255, 0, 0);
        textSize(75);
        text("TRY AGAIN!", 400, 170);
      }
    }
  }
}
}


//GRAPHICS FOR THE WARM AND COOL BUTTONS IN GAME_WC
void buttonsWC() {

  if (mousePressed && mouseY>400 && mouseX>0 && mouseX<width/2) { //when the user presses the "Warm Colour" button, the button's outline will turn white
    strokeWeight(5);
    stroke(255);
  } else { //when this button is not pressed, its outline will remain black
    strokeWeight(5);
    stroke(0);
  }

  fill(#E80800);
  rect(2, 400-3, 400, 100);

  if (mousePressed && mouseY>400 && mouseX>width/2 && mouseX<width) {  //when the user presses the "Cool Colour" button, the button's outline will turn white
    strokeWeight(5);
    stroke(255);
  } else { //when this button is not pressed, its outline will remain black
    strokeWeight(5);
    stroke(0);
  }

  fill(#005AE8);
  rect(400+7, 400-3, 400-10, 100);

  fill(255);
  textFont(gameFont);
  textAlign(CENTER, CENTER);
  textSize(30);
  text("WARM COLOUR", 0, 395, 400, 100);
  text("COOL COLOUR", 400, 395, 400, 100);
}

//MOUSE INTERACTION WITH THE WARM AND COOL COLOUR BUTTONS IN GAME_WC
void buttonInteraction() {

  if (mouseY>400 && (mouseX>0 && mouseX<width/2)) {
    if (mousePressed) { //when the user clicks the "Warm Colour" button (coordinates above), it will be evaluated whether or not the answer (element 0 in the colour array) is warm (w).
      correctWC = crynC[0] == w; 
      if (!correctWC) { //the message below will be shown when the user answers wrong
        fill(255, 0, 0);
        textSize(75);
        text("TRY AGAIN!", 400, 170);
      }
    }
  }
  if (mouseY>400 && (mouseX>400 && mouseX<width)) { //when the user clicks the "Cool Colour" button (coordinates above), it will be evaluated whether or not the answer (element 0 in the colour array) is cool (c).

    if (mousePressed) {
      correctWC = crynC[0] == c;

      if (!correctWC) { //the message below will be shown when the user answers wrong
        fill(255, 0, 0);
        textSize(75);
        text("TRY AGAIN!", 400, 170);
      }
    }
  }
} 






//PICKING A RANDOM CRAYON COLOUR FOR GAME_WC
/*
name                             type      description/purpose of variable

crynColours                     color[]    Stores values for 3 color elements (from
   one of the randomly selected switch cases
   below) under crynColours and returns the
   values to the method randomWarmCoolColor.   
*/
color[] randomWarmCoolColor() { //values stored under this method (called in gameWC for crynC; used for threeColours to colour Evil Crayon)
  color[] crynColours = new color[3];  //3 elements under crynColours (returned at the end)
  int randWC = int(random(1, 13)); //a random number from 1-12 is chosen

  switch(randWC) { //the randWC number will pick one of the cases below; elements 1 and 2 will colour the crayon, and element 0 is for whether that colour is warm or cool (the answer to a gameWC round)
  case 1: 
    crynColours[0] = w; 
    crynColours[1] = r; 
    crynColours[2] = r; 
    break;
  case 2: 
    crynColours[0] = w; 
    crynColours[1] = o; 
    crynColours[2] = o; 
    break;
  case 3: 
    crynColours[0] = w; 
    crynColours[1] = y; 
    crynColours[2] = y; 
    break;
  case 4: 
    crynColours[0] = w; 
    crynColours[1] = ro; 
    crynColours[2] = ro;
    break;
  case 5: 
    crynColours[0] = w; 
    crynColours[1] = yo; 
    crynColours[2] = yo; 
    break;
  case 6: 
    crynColours[0] = w; 
    crynColours[1] = yg; 
    crynColours[2] = yg; 
    break;
  case 7: 
    crynColours[0] = c; 
    crynColours[1] = g; 
    crynColours[2] = g; 
    break;
  case 8: 
    crynColours[0] = c; 
    crynColours[1] = b; 
    crynColours[2] = b; 
    break;
  case 9: 
    crynColours[0] = c; 
    crynColours[1] = v; 
    crynColours[2] = v; 
    break;
  case 10: 
    crynColours[0] = c; 
    crynColours[1] = bg; 
    crynColours[2] = bg; 
    break;
  case 11: 
    crynColours[0] = c; 
    crynColours[1] = bv; 
    crynColours[2] = bv; 
    break;
  case 12: 
    crynColours[0] = c; 
    crynColours[1] = rv; 
    crynColours[2] = rv; 
    break;
  }
  return crynColours;
}


//PICKING RANDOM CRAYON COLOURS FOR GAME_M
/*
name                             type      description/purpose of variable

crynColours                     color[]    Stores values for 3 color elements (from
   one of the randomly selected switch cases
   below) under crynColours and returns the
   values to the method randomMixingColor.   
*/
color[] randomMixingColor() { //values stored under this method (called in gameM for crynC; used for threeColours to colour Evil Crayon)
  color[] crynColours = new color[3]; //3 elements under crynColours (returned at the end)/3 elements
  int randM = int(random(1, 10)); //a random number from 1-9 is chosen

  switch(randM) { //the randM number will pick one of the cases below; elements 1 and 2 will colour the crayon, and element 0 is for what colour elements 1 and 2 make (the answer to a gameM round)
  case 1: 
    crynColours[0] = o; 
    crynColours[1] = r; 
    crynColours[2] = y; 
    break;
  case 2: 
    crynColours[0] = g; 
    crynColours[1] = y; 
    crynColours[2] = b; 
    break;
  case 3: 
    crynColours[0] = v; 
    crynColours[1] = b; 
    crynColours[2] = r; 
    break;
  case 4: 
    crynColours[0] = ro; 
    crynColours[1] = r; 
    crynColours[2] = o; 
    break;
  case 5: 
    crynColours[0] = yo; 
    crynColours[1] = o; 
    crynColours[2] = y; 
    break;
  case 6: 
    crynColours[0] = yg; 
    crynColours[1] = y; 
    crynColours[2] = g; 
    break;
  case 7: 
    crynColours[0] = bg; 
    crynColours[1] = g; 
    crynColours[2] = b; 
    break;
  case 8: 
    crynColours[0] = bv; 
    crynColours[1] = b; 
    crynColours[2] = v; 
    break;
  case 9: 
    crynColours[0] = rv; 
    crynColours[1] = v; 
    crynColours[2] = r; 
    break;
  }
  return crynColours;
}

//PICKING A RANDOM CRAYON COLOUR FOR GAME_C
/*
name                             type      description/purpose of variable

crynColours                     color[]    Stores values for 3 color elements (from
   one of the randomly selected switch cases
   below) under crynColours and returns the
   values to the method
   randomComplementaryColor.   
*/
color[] randomComplementaryColor() { //values stored under this method (called in gameC for crynC; used for threeColours to colour Evil Crayon)
  color[] crynColours = new color[3]; //3 elements under crynColours (returned at the end)
  int randC = int(random(1, 13)); //a random number from 1-12 is chosen

  switch(randC) { //the randC number will pick one of the cases below; elements 1 and 2 will colour the crayon, and element 0 is for the complementary colour of those elements (the answer to a gameC round)

  case 1: 
    crynColours[0] = g; 
    crynColours[1] = r; 
    crynColours[2] = r; 
    break;
  case 2: 
    crynColours[0] = b; 
    crynColours[1] = o; 
    crynColours[2] = o; 
    break;
  case 3: 
    crynColours[0] = v; 
    crynColours[1] = y; 
    crynColours[2] = y; 
    break;
  case 4: 
    crynColours[0] = bg; 
    crynColours[1] = ro; 
    crynColours[2] = ro;
    break;
  case 5: 
    crynColours[0] = bv; 
    crynColours[1] = yo; 
    crynColours[2] = yo; 
    break;
  case 6: 
    crynColours[0] = rv; 
    crynColours[1] = yg; 
    crynColours[2] = yg; 
    break;
  case 7: 
    crynColours[0] = r; 
    crynColours[1] = g; 
    crynColours[2] = g; 
    break;
  case 8: 
    crynColours[0] = o; 
    crynColours[1] = b; 
    crynColours[2] = b; 
    break;
  case 9: 
    crynColours[0] = y; 
    crynColours[1] = v; 
    crynColours[2] = v; 
    break;
  case 10: 
    crynColours[0] = ro; 
    crynColours[1] = bg; 
    crynColours[2] = bg; 
    break;
  case 11: 
    crynColours[0] = yo; 
    crynColours[1] = bv; 
    crynColours[2] = bv; 
    break;
  case 12: 
    crynColours[0] = yg; 
    crynColours[1] = rv; 
    crynColours[2] = rv; 
    break;
  }
  return crynColours;
}




//GRAPHICS FOR THE PROLOGUE BACKGROUND
void prologueBG() {
  pushMatrix();
  translate(400, 150);
  noStroke();
  fill(#C6F5F2);
  rect(0, 0, width, height); //sky
  fill(#b37447);
  rect(0, 300, width, 200); //table 
  popMatrix();

  //crayon box
  pushMatrix();
  translate(15, 50);
  fill(50);
  quad(360, 220, 540, 260, 540, 380, 360, 340);//opening side
  fill(25);
  quad(360, 340, 540, 380, 780, 300, 600, 300); //opening bottom
  fill(#DEC800);
  quad(540, 260, 780, 260, 540+240, 260+100, 540, 380); //side
  fill(#FAE100);
  quad(360, 220, 600, 220, 780, 260, 540, 260);  //top

  fill(255);
  textAlign(CENTER, CENTER);
  fill(255);
  textFont(boxFont);
  textSize(45);
  text("CRAYONS", 660, 310);
  popMatrix();
}

//GRAPHICS FOR THE LESSON BACKGROUND 
void lessonBG() {
  fill(#964B00);
  rect(0, 0, width, height);
  fill(#0F4603);
  rect(20, 20, width-40, height-40);
}

//GRAPHICS FOR THE GAME BACKGROUND
void gameBG() {
  noStroke();
  fill(#34A21F);
  rectMode(CORNER);
  rect(0, 0, width, height);

  //road
  fill(#5a5348);
  rect(0, 200, 800, 200);
  //road lines
  stroke(255);
  strokeWeight(10);
  for (int i = 10; i<=800; i+=90) { //making a small white line on the road repeat itself 90 pixels to the right again and again until just before it reaches the end of the window; starts at 10 x-coordinate
    line (i, 300, i+60, 300);
  }

  //sky
  noStroke();
  fill(#96F0E7);
  rect(0, 0, 800, 100);

  //trees
  stroke(0);
  strokeWeight(2);
  //pushMatrix();
  //translate(38, 0);
  for (int i = 88; i<=800; i+=150) { //making the tree repeat itself 150 pixels to the right again and again until just before it reaches the end of the window; starts at 88 x-coordinate

    fill(#796416);
    rect(i, 100, 20, 90);
    fill(#226216);
    ellipse(i+10, 100, 100, 100);
  }
}

//GRAPHICS FOR THE GOODBYE PAGE BACKGROUND
void goodbyeBG() {
  noStroke();
  //stroke(255);
  // strokeWeight(30);
  fill(255, 40, 40); //red
  triangle(0, 0, 100, 0, 0, 100);
  fill(255, 100, 0); //red-orange
  quad(100, 0, 200, 0, 0, 200, 0, 100);
  fill(255, 150, 0); //orange
  quad(200, 0, 300, 0, 0, 300, 0, 200);
  fill(255, 210, 0); //yellow-orange
  quad(300, 0, 400, 0, 0, 400, 0, 300);
  fill(255, 255, 0); //yellow
  quad(400, 0, 500, 0, 0, 500, 0, 400);
  fill(100, 255, 0); //yellow-green
  quad(500, 0, 600, 0, 0, 600, 0, 500);
  fill(0, 220, 0); //green
  quad(600, 0, 700, 0, 0, 700, 0, 600);
  fill(10, 150, 150); //blue-green
  quad(700, 0, 800, 0, 0, 800, 0, 700);
  fill(0, 100, 235); //blue
  quad(800, 0, 900, 0, 0, 900, 0, 800);
  fill(100, 0, 235); //blue-violet
  quad(900, 0, 1000, 0, 0, 1000, 0, 900);
  fill(180, 0, 180); //violet
  quad(1000, 0, 1100, 0, 0, 1100, 0, 1000);
  fill(220, 0, 130); //red-violet
  quad(1100, 0, 1200, 0, 0, 1200, 0, 1100);
  fill(255, 40, 40); //red
  quad(1200, 0, 1300, 0, 0, 1300, 0, 1200);
}
