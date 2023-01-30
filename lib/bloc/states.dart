abstract class states{}
class initialstate extends states{}
class counterchange extends states{}


class signuploadingstate extends states{}
class signupsuccessstate extends states{}
class signuperrorstate extends states{
  final String error ;
  signuperrorstate(this.error);
}

class loginloadingstate extends states{}
class loginsuccessstate extends states{}
class loginerrorstate extends states{}

class createuserloadingstate extends states{}
class createusersuccessstate extends states{}
class createusererrorstate extends states{}


class getuserloadingstate extends states{}
class getusersuccessstate extends states{}
class getusererrorstate extends states{}

class updateloadingstate extends states{}
class updatesuccessstate extends states{}
class updateerrorstate extends states{}