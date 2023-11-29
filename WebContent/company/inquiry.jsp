<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../menu.jsp" %>

<form action="registered.jsp" method="post">

    <h2 class="com_title">企業用お問い合わせフォーム</h2>

	<div class="inq_name">
      <p class="inqname">お名前</p>
      <input type="text" name="inq_name">
    </div>

	<div class="inq_com_name">
      <p class="inq_comname">企業名</p>
      <input type="text" name="inq_com_name">
    </div>

	<div class="inq_de_sign">
      <p class="inq_design">部署名</p>
      <input type="text" name="inq_de_sign">
    </div>

	<div class="inq_job_title">
      <p class="inq_jobtitle">役職名</p>
      <input type="text" name="inq_job_title">
    </div>

	<div class="inq_email">
      <p class="inqemail">メールアドレス</p>
      <input type="email" name="inq_email">
    </div>

	<div class="inq_phnum">
      <p class="inqphnum">電話番号</p>
      <input type="tel" name="inq_phnum">
    </div>

	<div class="contact_item">
	<p class="contact_items">お問い合わせ項目</p>
	  <select name="contact_item" id="inquiry">
          <option value="purchase">商品の販売について</option>
          <option value="sample">試供品について</option>
     	  <option value="review">レビューについて</option>
          <option value="other">その他</option>
      </select>
    </div>

	<div class="inq_detail">
      <p class="inqdetail">お問い合わせ内容</p>
      <input type="memo" name="inq_detail">
    </div>

<div class="inq_sending">
  <input class="sending" type="submit" value="送信">
</div>

</form>

<%@include file="../footer.jsp" %>