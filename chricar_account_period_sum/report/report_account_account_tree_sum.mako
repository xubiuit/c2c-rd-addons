<html>
<head>
                <b>Account-Chart Sum</b> requested by ${user.name}
</head>

  <body>
    <style  type="text/css">
     table {
       border-collapse: collapse;
       cellspacing="0";
       font-size:10px;
           }
     td {margin: 0px; padding: 3px; border: 1px solid lightgrey;  vertical-align: top; }
    </style> 

<p>
Selection:
%if context['data'] :
<%doc>
    FIXME - print default or actual paramaters
            waiting for Nicalas to fix bug and pass form params
</%doc>
  <table>
	    <tr>
	    <td>current: all posted</td>
            <td>previous: year to current month </td> 
	    </tr>
  </table>
%endif
<p>
<%
chapter.__init__()
%>

    <table  >

     <thead >
        <tr>
          <td>Level</td>
          <td>Chapter</td>
          <td>Code</td>
          <td>Name</td>
          <td align="right">Opening Balance</td>
          <td align="right">Debit</td>
          <td align="right">Credit</td>
          <td align="right">Balance</td>
          <td align="right">Balance Prev</td>
        </tr>
      </thead>


 %for account in objects :
     <tbody >
              %if (account.balance_sum !=0 or account.debit_sum !=0 or account.credit_sum !=0 or account.balance_prev_sum !=0):
              <tr>
          <td>${account.level or ''|entity}  </td>
          <td>
              %if account.type == 'view':
                 ${chapter.get_structure(account.level) or ''|entity}
              %endif  
          </td>
          <td>${account.code or ''|entity}  </td>
          <td>
              %if account.type == 'view' :
                <b>
              %endif
               ${account.name or ''|entity}  </td>
              %if account.type == 'view' :
                </b>
              %endif
          <td align=right NOWRAP>${formatLang(account.opening_balance_sum)  or ''|entity} </td>
          <td align=right NOWRAP>${formatLang(account.debit_sum) or ''|entity} </td>
          <td align=right NOWRAP>${formatLang(account.credit_sum) or ''|entity} </td>
          <td align=right NOWRAP>${formatLang(account.balance_sum) or ''|entity} </td>
          <td align=right NOWRAP>${formatLang(account.balance_prev_sum) or ''|entity} </td>
        </tr>
            %endif
      </tbody>
 %endfor
    </table>


  </body>
</html>