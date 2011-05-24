public class emailDetails {

    Email__c email;

    public Email__c getEmail(){
        email =  [select id, Sender__c, Username__c,Read__c, subject__c,Name,cont__c from Email__c where id =:System.currentPageReference().getParameters().get('id')];
        return email;
    }  
   
    public PageReference uncheck(){
        PageReference emailPage = new PageReference('/apex/emailList');
        email = getEmail();
        email.Read__c = true;
        update email;
        emailPage.setRedirect(true);
        return emailPage;
    }
 


    public void check(){
        email = getEmail();
        email.Read__c = false;
        update email;
    }

}