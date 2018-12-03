old_photo_id=ARGV[0]

$gm_module_list=["module.",".id=",".cos=",".chara"]
$chritm_prop=["cos.",".id=",".item."]
$iii_prop=[1,2,3,4,5,6,7,8,9,10]
$prop_prop=11
$prop_prop.to_i
def file_tbl(test)
	if test==$iii_prop[0]
		print"mikitm"
	end
	if test==$iii_prop[1]
		print"hakitm"
	end
	if test==$iii_prop[2]
		print"lukitm"
	end
	if test==$iii_prop[3]
		print"kaiitm"
	end
	if test==$iii_prop[4]
		print"meiitm"
	end
	if test==$iii_prop[5]
		print"neritm"
	end
	if test==$iii_prop[6]
		print"sakitm"
	end
	if test==$iii_prop[7]
		print"rinitm"
	end
	if test==$iii_prop[8]
		print"lenitm"
	end
	if test==$iii_prop[9]
		print"tetitm"
	end
end
def fun_name
	$chritm_prop_file.each_line do |prop_id_line|
		if $r_chritm_prop_head =~ prop_id_line
			new_prop=prop_id_line.split(".")
			$prop_id=new_prop[1].to_i
			#print"#{$prop_id}\n"#prop`s id
			cos_iten0=$chritm_prop[0].to_s+$prop_id.to_s+$chritm_prop[2].to_s+"0="
			cos_iten1=$chritm_prop[0].to_s+$prop_id.to_s+$chritm_prop[2].to_s+"1="
			cos_iten2=$chritm_prop[0].to_s+$prop_id.to_s+$chritm_prop[2].to_s+"2="
			cos_iten3=$chritm_prop[0].to_s+$prop_id.to_s+$chritm_prop[2].to_s+"3="
			cos_iten4=$chritm_prop[0].to_s+$prop_id.to_s+$chritm_prop[2].to_s+"4="
			$r_cos_iten0=Regexp.new(cos_iten0)
			$r_cos_iten1=Regexp.new(cos_iten1)
			$r_cos_iten2=Regexp.new(cos_iten2)
			$r_cos_iten3=Regexp.new(cos_iten3)
			$r_cos_iten4=Regexp.new(cos_iten4)
			$chritm_prop_file.each_line do |new_prop_id_line|
				if $r_cos_iten0 =~ new_prop_id_line
					new_cos_iten0=new_prop_id_line.split("=")
					$iten0=new_cos_iten0[1].to_i
					file_tbl($prop_prop)
					print"#{$iten0}\n"
				end
				if $r_cos_iten1 =~ new_prop_id_line
					new_cos_iten1=new_prop_id_line.split("=")
					$iten1=new_cos_iten1[1].to_i
					file_tbl($prop_prop)
					print"#{$iten1}\n"
				end
				if $r_cos_iten2 =~ new_prop_id_line
					new_cos_iten2=new_prop_id_line.split("=")
					$iten2=new_cos_iten2[1].to_i
					file_tbl($prop_prop)
					print"#{$iten2}\n"
				end
				if $r_cos_iten3 =~ new_prop_id_line
					new_cos_iten3=new_prop_id_line.split("=")
					$iten3=new_cos_iten3[1].to_i
					file_tbl($prop_prop)
					print"#{$iten3}\n"
				end
				if $r_cos_iten4 =~ new_prop_id_line
					new_cos_iten4=new_prop_id_line.split("=")
					$iten4=new_cos_iten4[1].to_i
					file_tbl($prop_prop)
					print"#{$iten4}\n"
				end
			end
		end
	end
end

old_photo_id="."+$gm_module_list[1].to_s+old_photo_id.to_s
r_photo_id=Regexp.new(old_photo_id)

old_modu_file=File.open("data/gm_list")
old_modu_file.each_line do |modu_id_line|#search modu`s id
	if r_photo_id =~ modu_id_line
		old_modu_id=modu_id_line.split(".")
		$modu_id=old_modu_id[1].to_i
		#print"#{$modu_id}\n"
	end
end
old_modu_file.close

old_modu_cos=$gm_module_list[0].to_s+$modu_id.to_s+$gm_module_list[2].to_s
old_modu_chara=$gm_module_list[0].to_s+$modu_id.to_s+$gm_module_list[3].to_s
r_modu_cos=Regexp.new(old_modu_cos)
r_modu_chara=Regexp.new(old_modu_chara)
#print"yes"
new_modu_file=File.open("data/gm_list")
new_modu_file.each_line do |new_modu_id_line|
	if r_modu_cos =~ new_modu_id_line
		new_modu_id=new_modu_id_line.split("_")
		#print"#{$modu_cos}\n"
		$modu_cos=new_modu_id[1].to_i-1
	end
	if r_modu_chara =~ new_modu_id_line
		new_modu_chara=new_modu_id_line.split("=")
		$modu_chara=new_modu_chara[1].to_s
		#print"#{$modu_chara}"
	end
end
new_modu_file.close

old_chritm_prop_head=$chritm_prop[1].to_s+$modu_cos.to_s
$r_chritm_prop_head=Regexp.new(old_chritm_prop_head)
if /MIKU/ =~ $modu_chara
	$chritm_prop_file=File.open("prop/mikitm_tbl")
	$prop_prop=1
	fun_name
	$chritm_prop_file.close
	#file_tbl($prop_prop)
end
if /HAKU/ =~ $modu_chara
	$chritm_prop_file=File.open("prop/hakitm_tbl")
	$prop_prop=2
	fun_name
	$chritm_prop_file.close
	#file_tbl($prop_prop)
end
if /LUKA/ =~ $modu_chara
	$chritm_prop_file=File.open("prop/lukitm_tbl")
	$prop_prop=3
	fun_name
	$chritm_prop_file.close
	#file_tbl($prop_prop)
end
if /KAITO/ =~ $modu_chara
	$chritm_prop_file=File.open("prop/kaiitm_tbl")
	$prop_prop=4
	fun_name
	$chritm_prop_file.close
	#file_tbl($prop_prop)
end
if /MEIKO/ =~ $modu_chara
	$chritm_prop_file=File.open("prop/meiitm_tbl")
	$prop_prop=5
	fun_name
	$chritm_prop_file.close
	#file_tbl($prop_prop)
end
if /NERU/ =~ $modu_chara
	$chritm_prop_file=File.open("prop/neritm_tbl")
	$prop_prop=6
	fun_name
	$chritm_prop_file.close
	#file_tbl($prop_prop)
end
if /SAKINE/ =~ $modu_chara
	$chritm_prop_file=File.open("prop/sakitm_tbl")
	$prop_prop=7
	fun_name
	$chritm_prop_file.close
	#file_tbl($prop_prop)
end
if /RIN/ =~ $modu_chara
	$chritm_prop_file=File.open("prop/rinitm_tbl")
	$prop_prop=8
	fun_name
	$chritm_prop_file.close
	#file_tbl($prop_prop)
end
if /LEN/ =~ $modu_chara
	$chritm_prop_file=File.open("prop/lenitm_tbl")
	$prop_prop=9
	fun_name
	$chritm_prop_file.close
	#file_tbl($prop_prop)
end
if /TETO/ =~ $modu_chara
	$chritm_prop_file=File.open("prop/tetitm_tbl")
	$prop_prop=10
	fun_name
	$chritm_prop_file.close
	#file_tbl($prop_prop)
end
print"Chara:#{$modu_chara}"
print"Module_id:#{$modu_id}\n"
print"Module_Cos_id:#{$modu_cos}\n"
print"Prop_id:#{$prop_id}\n"