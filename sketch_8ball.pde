String[] responses = {
  "It is certain.",
  "It is decidedly so.",
  "Without a doubt.",
  "Yes – definitely.",
  "You may rely on it.",
  "As I see it, yes.",
  "Most likely.",
  "Outlook good.",
  "Yes.",
  "Signs point to yes.",
  "Reply hazy, try again.",
  "Ask again later.",
  "Better not tell you now.",
  "Cannot predict now.",
  "Concentrate and ask again.",
  "Don't count on it.",
  "My reply is no.",
  "My sources say no.",
  "Outlook not so good.",
  "Very doubtful.",
  "Absolutely!",
  "I wouldn't count on it.",
  "You can rely on it.",
  "Ask again later.",
  "Yes, in due time.",
  "Definitely not.",
  "You will have to wait.",
  "I have my doubts.",
  "Outlook so so.",
  "Looks good to me!",
  "Who knows?",
  "Looking good!",
  "Probably.",
  "Are you kidding?",
  "Don't bet on it.",
  "Forget about it.",
  "Not in a million years.",
  "Of course!",
  "The stars say yes.",
  "Yes, but be cautious.",
  "Very likely.",
  "I would say so.",
  "Not likely.",
  "Absolutely yes.",
  "Yes, definitely.",
  "Yes, without a doubt.",
  "Most certainly.",
  "You can count on it.",
  "No way!",
  "Not possible.",
  "Don't hold your breath.",
  "In your dreams.",
  "Go for it.",
  "Sure, why not?",
  "Yes, but take care.",
  "Better not now.",
  "Sure thing.",
  "Maybe, maybe not.",
  "Yes, but later.",
  "It will happen.",
  "Not in the near future.",
  "It's uncertain.",
  "Yes, yes, yes!",
  "No, no, no!",
  "Chances are high.",
  "Chances are low.",
  "Yes, when the time is right.",
  "No, not yet.",
  "It's not clear.",
  "Looks promising.",
  "It's not looking good.",
  "Yes, sooner or later.",
  "Unlikely.",
  "Definitely!",
  "It's in the stars.",
  "I wouldn't think so.",
  "Ask again tomorrow.",
  "Yes, but be careful.",
  "No, better not.",
  "Yes, if you believe.",
  "No, if you doubt.",
  "Yes, and good luck!",
  "No, and be cautious.",
  "Maybe, it's uncertain.",
  "Yes, take a chance.",
  "No, don't risk it.",
  "Yes, with confidence.",
  "No, with caution.",
  "Perhaps, who knows?",
  "Maybe yes, maybe no.",
  "Yes, it's likely.",
  "No, it's unlikely.",
  "Yes, trust yourself.",
  "No, trust the process.",
  "Yes, but stay grounded.",
  "No, stay realistic.",
  "Yes, it will work out.",
  "No, it will not work out."
};

PFont font;
String currentQuestion = "";
String currentResponse = "";
boolean answered = false;

void setup() {
  fullScreen();
  font = createFont("Arial", 24);
  textAlign(CENTER, CENTER);
  textFont(font);
}

void draw() {
  background(255);
  drawMagic8Ball();
  fill(0);
  if (answered) {
    text(currentResponse, width/2, height/2 + 50);
    textSize(20);
    text("Press Enter to ask another question", width/2, height/2 + 100);
  } else {
    textSize(20);
    text("Ask the Magic 8 Ball a question:", width/2, height/2 - 200);
    text(currentQuestion, width/2, height/2 - 150);
  }
}

void keyPressed() {
  if (answered) {
    if (key == ENTER || key == RETURN) {
      answered = false;
      currentQuestion = "";
      currentResponse = "";
    }
  } else {
    if (key == ENTER || key == RETURN) {
      if (currentQuestion.length() > 0) {
        currentResponse = responses[int(random(responses.length))];
        answered = true;
      }
    } else if (key == BACKSPACE) {
      if (currentQuestion.length() > 0) {
        currentQuestion = currentQuestion.substring(0, currentQuestion.length() - 1);
      }
    } else if (key != CODED) {
      currentQuestion += key;
    }
  }
}

void drawMagic8Ball() {
  fill(0);
  ellipse(width/2, height/2, 400, 400); // Magic 8 Ball outline
  fill(255);
  ellipse(width/2, height/2, 380, 380); // White inner circle
  fill(0);
  textSize(50);
  text("8", width/2, height/2); // Draw the number 8 in the center
  if (answered) {
    fill(255);
    textSize(20);
    text(currentResponse, width/2, height/2); // Draw the response inside the ball
  }
}
